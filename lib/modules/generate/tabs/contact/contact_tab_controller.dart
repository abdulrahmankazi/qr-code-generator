import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/routes/app_route.dart';
import 'package:screenshot/screenshot.dart';

class ContactTabController extends GetxController {
  var screenshotController = ScreenshotController();
  var contactFormKey = GlobalKey<FormState>();

  void generateQRCode() {
    try {
      if (contactFormKey.currentState!.validate()) {
        var data = {
          'data': '''BEGIN:VCARD
        VERSION:3.0
        FN:Sandeep
        ADR:;;123 Street;City;Region;PostalCode;Country
        TEL:+908888888888
        TEL:+901111111111
        TEL:+902222222222
        EMAIL;TYPE=home:homeemail@example.com
        EMAIL;TYPE=work:workemail@example.com
        URL:http://www.google.com
        END:VCARD'''
        };
        Get.toNamed(AppRoutes.generateQr, arguments: data);
      }
    } catch (error) {
      print('Error::::$error');
    }
  }
}
