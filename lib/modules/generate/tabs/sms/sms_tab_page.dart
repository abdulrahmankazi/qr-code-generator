import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/string_constant.dart';
import 'sms_tab_controller.dart';

class SMSTabPage extends StatelessWidget {
  SMSTabPage({Key? key}) : super(key: key);
  final smsTabController = Get.put(SMSTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            smsTabController.generateQRCode();
          },
          child: Text(
            StringConstant.generateQR,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: smsTabController.smsFormKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: smsTabController.prefixController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: StringConstant.countryCode,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          // initialValue: 'https://',
                          controller: smsTabController.mobileTextController,
                          decoration: InputDecoration(
                            labelText: StringConstant.enterMobileNumber,
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringConstant.pleaseEnterMobileNumber;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: smsTabController.bodyTextController,
                    decoration: InputDecoration(
                      labelText: StringConstant.enterBody,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
