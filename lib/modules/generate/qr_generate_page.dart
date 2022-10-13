import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/constants/string_constant.dart';
import 'package:qr_code_scanner/modules/generate/tabs/telephone/telephone_tab_page.dart';
import 'package:qr_code_scanner/modules/generate/tabs/whatsapp/whatsapp_tab_page.dart';

import 'qr_generate_controller.dart';
import 'tabs/email/email_tab_page.dart';
import 'tabs/sms/sms_tab_page.dart';
import 'tabs/text/text_tab_page.dart';
import 'tabs/url/url_tab_page.dart';

class QRGeneratePage extends StatelessWidget {
  QRGeneratePage({Key? key}) : super(key: key);
  final qrGenerateController = Get.put(QRGenerateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.generateQR),
        bottom: TabBar(
          controller: qrGenerateController.tabBarController,
          isScrollable: true,
          padding: EdgeInsets.zero,
          onTap: (newIndex) {
            qrGenerateController.updateTabBarIndex(newIndex);
          },
          tabs: [
            Tab(
              icon: const Icon(Icons.text_snippet_outlined),
              text: StringConstant.text,
            ),
            Tab(
              icon: const Icon(Icons.link_outlined),
              text: StringConstant.url,
            ),
            Tab(
              icon: const Icon(Icons.mail_outline),
              text: StringConstant.email,
            ),
            Tab(
              icon: const Icon(Icons.sms_outlined),
              text: StringConstant.sms,
            ),
            Tab(
              icon: const Icon(Icons.call_outlined),
              text: StringConstant.call,
            ),
            Tab(
              icon: const Icon(Icons.whatsapp_outlined),
              text: StringConstant.whatsapp,
            ),
            /*Tab(
              icon: const Icon(
                Icons.contact_mail_outlined,
              ),
              text: StringConstant.contact,
            ),*/
          ],
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text(StringConstant.darkMode),
                    trailing: const Icon(
                      Icons.dark_mode,
                    ),
                    onTap: () {
                      qrGenerateController.changeTheme();
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(StringConstant.scanQr),
                    subtitle: Text(StringConstant.comingSoon),
                    onTap: () {},
                  ),
                  const Divider(),
                  /*ListTile(
                    title: Text(StringConstant.rateApp),
                    onTap: () {
                    },
                  ),*/
                  /*ListTile(
                    title: Text(StringConstant.contact),
                    onTap: () {
                      // qrGenerateController.showAboutPage();
                    },
                  ),*/
                  /*ListTile(
                    title: Text(StringConstant.privacyPolicy),
                    onTap: () {
                      // qrGenerateController.showAboutPage();
                    },
                  ),*/
                  ListTile(
                    title: Text(StringConstant.about),
                    onTap: () {
                      qrGenerateController.showAboutPage();
                    },
                  ),
                  ListTile(
                    trailing: Obx(
                      () => Text(
                        'v ${qrGenerateController.currentVersion.value}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    /*onTap: () {
                      qrGenerateController.showAboutPage();
                    },*/
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: qrGenerateController.tabBarController,
        children: [
          TextTabPage(),
          URLTabPage(),
          EmailTabPage(),
          SMSTabPage(),
          TelephoneTabPage(),
          WhatsappTabPage(),
          // ContactTabPage(),
        ],
      ),
    );
  }
}
