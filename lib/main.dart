import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/modules/generate/qr_generate/generate_qr_page.dart';
import 'package:qr_code_scanner/routes/app_route.dart';
import 'package:qr_code_scanner/util/pref_util.dart';

import 'modules/about/about_page.dart';
import 'modules/home/qrcode_home_page.dart';
import 'modules/scan/qr_scan_page.dart';
import 'modules/scan_result/qr_scan_result_page.dart';
import 'style/qrcode_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  runApp(const QRCodeScannerApp());
}

class QRCodeScannerApp extends StatelessWidget {
  const QRCodeScannerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: QRCodeTheme.darkTheme,
      // theme: ThemeMode.system,
      // themeMode: ThemeMode.system,
      theme: QRCodeTheme.lightThemeData,
      darkTheme: QRCodeTheme.darkThemeData,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.home,
      getPages: [
        GetPage(
          name: AppRoutes.home,
          page: () => QRCodeHomePage(),
        ),
        GetPage(
          name: AppRoutes.scan,
          page: () => QRScanPage(),
        ),
        GetPage(
          name: AppRoutes.scanResult,
          page: () => QRScanResultPage(),
        ),
        GetPage(
          name: AppRoutes.generateQr,
          page: () => GenerateQRPage(),
        ),
        GetPage(
          name: AppRoutes.about,
          page: () => AboutPage(),
        ),
      ],
    );
  }
}
