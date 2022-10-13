import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../constants/string_constant.dart';
import '../../../../routes/app_route.dart';
import 'whatsapp_tab_page.dart';

class WhatsappTabController extends GetxController {
  var prefixController = TextEditingController();
  var mobileNumberTextController = TextEditingController();
  var bodyTextController = TextEditingController();

  var whatsappFormKey = GlobalKey<FormState>();

  var screenshotController = ScreenshotController();

  @override
  void onInit() {
    super.onInit();
    prefixController.text = '+91';
  }

  void generateQRCode() {
    try {
      if (whatsappFormKey.currentState!.validate()) {
        print(mobileNumberTextController.text);

        var data = {
          'data':
              'https://wa.me/${prefixController.text}${mobileNumberTextController.text}?text=${bodyTextController.text}'
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
