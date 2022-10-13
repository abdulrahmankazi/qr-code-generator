import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'qrcode_home_controller.dart';

class QRCodeHomePage extends StatelessWidget {
  QRCodeHomePage({Key? key}) : super(key: key);
  final qRCodeHomeController = Get.put(QRCodeHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(StringConstant.appName),
      ),*/
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          qRCodeHomeController.navigateToQRScan();
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/

      /*bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.qr_code_outlined),
              label: StringConstant.generateQR,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.access_time_outlined),
              label: StringConstant.history,
            ),
          ],
          selectedLabelStyle: QRCodeStyle.quoteSelectedBottomStyle,
          iconSize: 32.0,
          currentIndex: qRCodeHomeController.selectedIndex.value,
          onTap: (newIndex) {
            qRCodeHomeController.updateSelectedIndex(newIndex);
          },
        ),
      ),*/
      body: Obx(
        () => qRCodeHomeController
            .pages[qRCodeHomeController.selectedIndex.value],
      ),
    );
  }
}
