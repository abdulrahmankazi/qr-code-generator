import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_scanner/modules/generate/tabs/url/url_tab_page.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_file/open_file.dart';

import '../../../../constants/string_constant.dart';
import '../../../../routes/app_route.dart';

class URLTabController extends GetxController {
  var urlTextController = TextEditingController();

  var urlFormKey = GlobalKey<FormState>();
  var screenshotController = ScreenshotController();

  @override
  void onInit() {
    super.onInit();
    urlTextController.text = 'https://';
  }

  void generateQRCode() {
    try {
      if (urlFormKey.currentState!.validate()) {
        print(urlTextController.text);

        var data = {
          'data': urlTextController.text,
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
