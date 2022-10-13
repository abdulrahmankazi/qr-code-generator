import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/string_constant.dart';
import 'url_tab_controller.dart';

class URLTabPage extends StatelessWidget {
  URLTabPage({Key? key}) : super(key: key);
  final urlTabController = Get.put(URLTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            urlTabController.generateQRCode();
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
              key: urlTabController.urlFormKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    // initialValue: 'https://',
                    controller: urlTabController.urlTextController,
                    decoration: InputDecoration(
                      hintText: StringConstant.urlHint,
                      labelText: StringConstant.enterURL,
                      border: const OutlineInputBorder(),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringConstant.pleaseEnterValidURL;
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
