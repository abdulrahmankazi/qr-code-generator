import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_code_scanner/routes/app_route.dart';
import 'package:qr_code_scanner/style/qrcode_theme.dart';

class QRGenerateController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var qrData = 'https://www.google.com'.obs;

  var tabBarController;
  var tabBarIndex = 0.obs;

  var currentVersion = '1'.obs;

  @override
  void onInit() {
    super.onInit();

    tabBarController = TabController(length: 6, vsync: this);

    getVersionDetails();
  }

  void updateTabBarIndex(int newIndex) {
    tabBarIndex.value = newIndex;
  }

  void navigateToQRScan() {
    try {
      Get.toNamed(AppRoutes.scan);
    } catch (error) {
      print(error);
    }
  }

  void changeTheme() {
    print('isDarkMode::: ${Get.isDarkMode}');
    if (Get.isDarkMode) {
      Get.changeTheme(QRCodeTheme.lightThemeData);
    } else {
      Get.changeTheme(QRCodeTheme.darkThemeData);
    }
  }

  void showAboutPage() {
    try {
      Get.back();
      Get.toNamed(AppRoutes.about);
    } catch (error) {
      print(error);
    }
  }

  void getVersionDetails() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      currentVersion.value = packageInfo.version;
      print('Version___${packageInfo.version}');
    } catch (error) {
      print(error);
    } finally {
      checkForUpdate();
    }
  }

  void checkForUpdate() async {
    try {
      final newVersion = NewVersion(
          // androidId: 'com.softechark.qrcode',
          );
      final status = await newVersion.getVersionStatus();
      newVersion.showAlertIfNecessary(
        context: Get.context!,
      );
    } catch (error) {
      print(error);
    }
  }
}
