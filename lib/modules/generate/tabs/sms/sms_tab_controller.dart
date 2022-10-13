import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../constants/string_constant.dart';
import '../../../../routes/app_route.dart';
import 'sms_tab_page.dart';

class SMSTabController extends GetxController {
  var prefixController = TextEditingController();
  var mobileTextController = TextEditingController();
  var bodyTextController = TextEditingController();

  var smsFormKey = GlobalKey<FormState>();
  var screenshotController = ScreenshotController();

  @override
  void onInit() {
    super.onInit();
    prefixController.text = '+91';
  }

  void generateQRCode() {
    try {
      if (smsFormKey.currentState!.validate()) {
        print(mobileTextController.text);

        var data = {
          'data':
              'smsto:${prefixController.text}${mobileTextController.text}?body=${bodyTextController.text}',
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
