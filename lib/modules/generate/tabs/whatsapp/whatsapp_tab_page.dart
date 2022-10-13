import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/string_constant.dart';
import 'whatsapp_tab_controller.dart';

class WhatsappTabPage extends StatelessWidget {
  WhatsappTabPage({Key? key}) : super(key: key);
  final whatsappTabController = Get.put(WhatsappTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            whatsappTabController.generateQRCode();
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
              key: whatsappTabController.whatsappFormKey,
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
                          controller: whatsappTabController.prefixController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: StringConstant.countryCode,
                          ),
                          keyboardType: TextInputType.phone,
                          /*validator: (value) {
                            if (value!.isEmpty) {
                              return StringConstant.pleaseEnterMobileNumber;
                            }
                            return null;
                          },*/
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          controller:
                              whatsappTabController.mobileNumberTextController,
                          decoration: InputDecoration(
                            labelText: StringConstant.enterMobileNumber,
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringConstant.pleaseEnterMobileNumber;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: whatsappTabController.bodyTextController,
                    decoration: InputDecoration(
                      labelText: StringConstant.enterMessage,
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
