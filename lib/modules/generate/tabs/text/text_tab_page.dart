import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/string_constant.dart';
import 'text_tab_controller.dart';

class TextTabPage extends StatelessWidget {
  TextTabPage({Key? key}) : super(key: key);
  final textTabController = Get.put(TextTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            textTabController.generateQRCode();
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
              key: textTabController.textFormKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: textTabController.textController,
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
