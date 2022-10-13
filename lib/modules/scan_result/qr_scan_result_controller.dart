import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScanResultController extends GetxController {
  late Barcode barcode;
  var args;

  @override
  void onInit() {
    super.onInit();

    getArguments();
    // args = Barcode(rawValue: arguments['args']);
  }

  void getArguments() {
    var arguments = Get.arguments;
    Barcode rawValue = arguments['barcode'];
    barcode = Barcode(rawValue: rawValue.rawValue);

    print('Detected::: ${barcode.rawValue}');
    print('type::: ${barcode.type}');
  }

  void onTextClicked() async {
    try {
      print('Type::: ${barcode.type}');
      switch (barcode.type) {
        case BarcodeType.text:
          print('Contact');
          final uri = Uri.parse('tel:${barcode.rawValue!}');
          launchContact(uri);
          break;

        case BarcodeType.phone:
          print('Phone');
          final uri = Uri.parse('tel:${barcode.rawValue!}');
          launchContact(uri);
          break;

        case BarcodeType.unknown:
          // TODO: Handle this case.
          break;
        case BarcodeType.contactInfo:
          // TODO: Handle this case.
          break;
        case BarcodeType.email:
          // TODO: Handle this case.
          break;
        case BarcodeType.isbn:
          // TODO: Handle this case.
          break;
        case BarcodeType.product:
          // TODO: Handle this case.
          break;
        case BarcodeType.sms:
          // TODO: Handle this case.
          break;
        case BarcodeType.url:
          // TODO: Handle this case.
          break;
        case BarcodeType.wifi:
          // TODO: Handle this case.
          break;
        case BarcodeType.geo:
          // TODO: Handle this case.
          break;
        case BarcodeType.calendarEvent:
          // TODO: Handle this case.
          break;
        case BarcodeType.driverLicense:
          // TODO: Handle this case.
          break;
      }
    } catch (error) {
      print(error);
    }
  }

  void launchContact(Uri uri) async {
    print('inside contact');
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {}
  }
}
