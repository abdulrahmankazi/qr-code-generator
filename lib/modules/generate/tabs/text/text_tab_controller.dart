import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/routes/app_route.dart';
import 'package:screenshot/screenshot.dart';

class TextTabController extends GetxController {
  var textController = TextEditingController();
  var textFormKey = GlobalKey<FormState>();

  var screenshotController = ScreenshotController();

  void generateQRCode() {
    try {
      if (textFormKey.currentState!.validate()) {
        print(textController.text);

        var data = {
          'data': textController.text,
        };

        Get.toNamed(
          AppRoutes.generateQr,
          arguments: data,
        );
      }
    } catch (error) {
      print('Error::::$error');
    }
  }
}
