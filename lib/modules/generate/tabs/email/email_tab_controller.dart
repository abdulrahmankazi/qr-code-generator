import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../routes/app_route.dart';

class EmailTabController extends GetxController {
  var emailTextController = TextEditingController();
  var ccTextController = TextEditingController();
  var subjectTextController = TextEditingController();
  var bodyTextController = TextEditingController();

  var emailFormKey = GlobalKey<FormState>();

  var screenshotController = ScreenshotController();

  @override
  void onInit() {
    super.onInit();
  }

  void generateQRCode() {
    try {
      if (emailFormKey.currentState!.validate()) {
        print(emailTextController.text);
        print(subjectTextController.text);

        var data = {
          'data':
              'mailto:${emailTextController.text}?cc=${ccTextController.text}&subject=${subjectTextController.text}&body=${bodyTextController.text}'
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
