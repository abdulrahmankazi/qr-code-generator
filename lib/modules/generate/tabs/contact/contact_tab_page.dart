import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../constants/string_constant.dart';
import 'contact_tab_controller.dart';

class ContactTabPage extends StatelessWidget {
  ContactTabPage({Key? key}) : super(key: key);
  final contactTabController = Get.put(ContactTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            contactTabController.generateQRCode();
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
              key: contactTabController.contactFormKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    // controller: contactTabController.textController,
                    decoration: InputDecoration(
                      // hintText: StringConstant.emailHint,
                      labelText: StringConstant.enterText,
                      border: const OutlineInputBorder(),
                    ),
                    minLines: 1,
                    maxLines: 6,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringConstant.pleaseEnterText;
                      }
                      return null;
                    },
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
