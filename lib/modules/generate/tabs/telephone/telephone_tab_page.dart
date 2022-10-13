import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/string_constant.dart';
import 'telephone_tab_controller.dart';

class TelephoneTabPage extends StatelessWidget {
  TelephoneTabPage({Key? key}) : super(key: key);
  final telephoneTabController = Get.put(TelephoneTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            telephoneTabController.generateQRCode();
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
              key: telephoneTabController.telephoneFormKey,
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
                          controller: telephoneTabController.prefixController,
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
                          controller:
                              telephoneTabController.mobileTextController,
                          decoration: InputDecoration(
                            labelText: StringConstant.enterMobileNumber,
                            border: const OutlineInputBorder(),
                          ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
