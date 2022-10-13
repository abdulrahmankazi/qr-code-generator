import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/constants/string_constant.dart';
import 'package:qr_code_scanner/modules/scan_result/qr_scan_result_controller.dart';

import 'package:qr_code_scanner/style/qrocde_style.dart';

class QRScanResultPage extends StatelessWidget {
  QRScanResultPage({Key? key}) : super(key: key);
  final qRScanResultController = Get.put(QRScanResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.scanResult),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            // padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        qRScanResultController.onTextClicked();
                      },
                      child: Text(
                        qRScanResultController.barcode.rawValue!,
                        style: QRCodeStyle.qrCodeTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.copy_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

/*BarcodeTypeWidget({required BarcodeType barcodeType}) {
    switch (barcodeType) {
      // case barcodeType
    }
  }*/
}
