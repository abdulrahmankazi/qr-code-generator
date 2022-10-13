import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routes/app_route.dart';

class QRScanController
    extends GetxController // FullLifeCycleController with FullLifeCycleMixin
{
  var isTorchOn = false.obs;
  MobileScannerController mobileScannerController = MobileScannerController();
  var isLoading = false.obs;

  @override
  void onInit() {
    print('MODE___onInit');
    super.onInit();
    // mobileScannerController = MobileScannerController();

    checkPermission();
  }

  checkPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      print('status.isGranted');
    } else if (status.isDenied) {
      await Permission.camera.request();
      print('status.isDenied');
    } else if (status.isPermanentlyDenied) {
      print('status.isPermanentlyDenied');
    }
  }

/*

  @override
  void onReady() {
    print('MODE___onReady');
    super.onReady();
  }

  @override
  void dispose() {
    print('MODE___onDispose');
    // mobileScannerController.stop();
    // mobileScannerController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    print('MODE___onCLOSE');

    super.onClose();
  }
*/

  void toggleFlash() {
    mobileScannerController.toggleTorch();

    print('On ${isTorchOn.value}');
  }

  void switchCamera() {
    mobileScannerController.switchCamera();
  }

  void qrCodeDetected(Barcode barcode, MobileScannerArguments args) {
    try {
      isLoading.value = true;
      print('isLoading::: $isLoading');
      if (barcode.rawValue == null) {
        print('Nothing Found');
      } else {
        String code = barcode.rawValue!;
        print('typeDetected:::: ${barcode.type}');
        Get.toNamed(
          AppRoutes.scanResult,
          arguments: {
            'barcode': barcode,
            'args': args,
          },
        );
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }

  void uploadImage() async {
    try {
      final imagePicker = ImagePicker();
      var image = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      /*Get.toNamed(
        AppRoutes.scanResult,
        arguments: {
          'barcode': barcode,
          'args': args,
        },
      );*/

      print('Path:::: ${image!.path}');
      mobileScannerController.analyzeImage(image.path);
    } catch (error) {
      print(error);
    }
  }
/*
  @override
  void onDetached() {
    print('HomeController - onDetached called');
  }

  // Mandatory
  @override
  void onInactive() {
    print('HomeController - onInative called');
  }

  // Mandatory
  @override
  void onPaused() {
    print('HomeController - onPaused called');
  }

  // Mandatory
  @override
  void onResumed() {
    print('HomeController - onResumed called');
  }

  // Optional
  @override
  Future<bool> didPushRoute(String route) {
    print('HomeController - the route $route will be open');
    return super.didPushRoute(route);
  }

  // Optional
  @override
  Future<bool> didPopRoute() {
    print('HomeController - the current route will be closed');
    return super.didPopRoute();
  }

  // Optional
  @override
  void didChangeMetrics() {
    print('HomeController - the window size did change');
    super.didChangeMetrics();
  }

  // Optional
  @override
  void didChangePlatformBrightness() {
    print('HomeController - platform change ThemeMode');
    super.didChangePlatformBrightness();
  }*/
}
