import 'package:get/get.dart';
import 'package:qr_code_scanner/modules/generate/qr_generate_page.dart';
import 'package:qr_code_scanner/modules/scan/qr_scan_page.dart';
import 'package:qr_code_scanner/routes/app_route.dart';

class QRCodeHomeController extends GetxController {
  var selectedIndex = 0.obs;

  var pages = [
    // Generate QR
    QRGeneratePage(),
    // History
    QRScanPage(),
    // QRHistoryPage(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void updateSelectedIndex(int newIndex) {
    selectedIndex.value = newIndex;
  }

  void navigateToQRScan() {
    Get.toNamed(
      AppRoutes.scan,
    );
  }
}
