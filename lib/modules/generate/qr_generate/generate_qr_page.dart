import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../../../constants/string_constant.dart';
import 'generate_qr_controller.dart';

class GenerateQRPage extends StatelessWidget {
  final generateQRController = Get.put(GenerateQRController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstant.download,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: IconButton(
              onPressed: () {
                generateQRController.showEditMenu();
              },
              icon: const Icon(Icons.dashboard_customize_outlined),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            generateQRController.saveImage();
          },
          child: Text(
            StringConstant.save,
          ),
        ),
      ),
      body: Screenshot(
        controller: generateQRController.screenshotController,
        child: Center(
          child: Obx(
            () => generateQRController.data.value.isEmpty
                ? const CircularProgressIndicator()
                : QrImage(
                    data: generateQRController.data.value,
                    foregroundColor:
                        generateQRController.qrForegroundColor.value,
                    backgroundColor: Colors.white,
                    size: MediaQuery.of(context).size.width /
                        generateQRController.qrWidth /*.value*/,
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
