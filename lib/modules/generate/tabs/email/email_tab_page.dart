import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/constants/string_constant.dart';

import 'email_tab_controller.dart';

class EmailTabPage extends StatelessWidget {
  EmailTabPage({Key? key}) : super(key: key);
  final emailTabController = Get.put(EmailTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(),
          onPressed: () {
            emailTabController.generateQRCode();
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
              key: emailTabController.emailFormKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailTabController.emailTextController,
                    decoration: InputDecoration(
                      hintText: StringConstant.emailHint,
                      labelText: StringConstant.enterEmail,
                      border: const OutlineInputBorder(),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringConstant.pleaseEnterEmail;
                      } else if (!(value.isEmail)) {
                        return StringConstant.pleaseEnterValidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: emailTabController.ccTextController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      // hintText: StringConstant.emailHint,
                      labelText: StringConstant.enterCC,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: emailTabController.subjectTextController,
                    decoration: InputDecoration(
                      // hintText: StringConstant.emailHint,
                      labelText: StringConstant.enterSubject,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: emailTabController.bodyTextController,
                    decoration: InputDecoration(
                      // hintText: StringConstant.emailHint,
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
