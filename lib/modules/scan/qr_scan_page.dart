import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/constants/string_constant.dart';

import 'qr_scan_controller.dart';

class QRScanPage extends StatefulWidget {
  QRScanPage({Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> with WidgetsBindingObserver {
  final qRScanController = Get.put(QRScanController());

  @override
  void initState() {
    super.initState();
    print('initState');
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print('dispose');
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      print('AppLifecycleState.paused');
    }
    if (state == AppLifecycleState.resumed) {
      print('AppLifecycleState.resumed');
    }

    if (state == AppLifecycleState.inactive) {
      print('AppLifecycleState.inactive');
    }
    if (state == AppLifecycleState.detached) {
      print('AppLifecycleState.detached');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.scan),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(
            16.0,
          ),
          child: Obx(
            () => qRScanController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 2,
                          child: MobileScanner(
                            allowDuplicates: false,
                            controller:
                                qRScanController.mobileScannerController,
                            fit: BoxFit.cover,
                            onDetect: (Barcode barcode,
                                MobileScannerArguments? args) {
                              print(barcode.rawValue);
                              print('TYPE::::${barcode.type}');
                              print(args!.webId);

                              qRScanController.qrCodeDetected(barcode, args);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                qRScanController.toggleFlash();
                              },
                              iconSize: 36.0,
                              icon: ValueListenableBuilder(
                                valueListenable: qRScanController
                                    .mobileScannerController.torchState,
                                builder: (context, state, child) {
                                  switch (state as TorchState) {
                                    case TorchState.on:
                                      return const Icon(
                                          Icons.flash_on_outlined);
                                    case TorchState.off:
                                      return const Icon(
                                          Icons.flash_off_outlined);
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                qRScanController.switchCamera();
                              },
                              iconSize: 36.0,
                              icon: const Icon(
                                Icons.flip_camera_ios_outlined,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            qRScanController.uploadImage();
                          },
                          child: Text(StringConstant.uploadFromGallery),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
