import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/constants/string_constant.dart';

import 'about_controller.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);
  final aboutController = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.aboutUs),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                    ),
                    color: Colors.orangeAccent),
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
            Positioned(
              top: 32,
              right: 16.0,
              left: 16.0,
              child: Card(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset('assets/icons/qr_logo.png'),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          StringConstant.appName,
                          style: const TextStyle(
                            // fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 2.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          StringConstant.appDescription,
                          textScaleFactor: 1.2,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(StringConstant.qrScanComingSoon),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: ElevatedButton(
          onPressed: () {
            aboutController.sendEmail();
          },
          child: Text(StringConstant.mailUs),
        ),
      ),
    );
  }
}
