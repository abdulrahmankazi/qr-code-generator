import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/constants/string_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void sendEmail() async {
    try {
      var emailAddress = StringConstant.emailAddress;
      Uri emailUri = Uri.parse('mailto:$emailAddress?subject=Qr Code App');

      // var deviceDetails = getDeviceDetails();

      if (await launchUrl(emailUri)) {
        print('Could not Launch');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<String> getDeviceDetails() async {
    var deviceInfo = '';
    try {} catch (error) {
      print(error);
    }
    return deviceInfo;
  }
}
