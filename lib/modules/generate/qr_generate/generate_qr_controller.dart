import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../../../constants/string_constant.dart';

class GenerateQRController extends GetxController {
  var screenshotController = ScreenshotController();
  var currentColor = Color(0xFF25003e).obs;
  var qrForegroundColor = Color(0xFF000000).obs;

  var data = ''.obs;
  var qrWidth = 1.1 /*.obs*/;

  var textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    data.value = Get.arguments['data'];
    print('data::::${data.value}');
  }

  updateColor(Color value) {
    print('Colors___$value');
    qrForegroundColor.value = value;
  }

  void captureAndSaveQRImage() async {
    try {
      await Permission.storage.request();
      var storageStatus = await Permission.storage.status;
      if (storageStatus.isGranted) {
        print('storageStatus.isGranted');
        final directory = await getTemporaryDirectory();
        var fileName = '${DateTime.now().microsecondsSinceEpoch}_arkQrCode.jpg';
        var filePath = directory.path;

        var imagePath = await screenshotController.captureAndSave(filePath,
            fileName: fileName);

        await GallerySaver.saveImage(imagePath!, albumName: 'ARKQrCode').then(
          (result) async {
            if (result!) {
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                SnackBar(
                  content: Text(StringConstant.savedInGallery),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else {
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                SnackBar(
                  content: Text(StringConstant.someErrorOccurred),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        );
      } else {
        showPermissionDialog();
      }
      /* else if (storageStatus.isDenied) {
        print('storageStatus.isDenied');
        // await Permission.storage.request();
        showPermissionDialog();
      } else if (storageStatus.isPermanentlyDenied) {
        showPermissionDialog();
      }*/

    } catch (error) {
      print('ERROR::::$error');
    }
  }

  void showPermissionDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(StringConstant.storageAccessRequired),
          actions: [
            TextButton(
              onPressed: () async {
                Get.back();
              },
              child: Text(StringConstant.cancel),
            ),
            TextButton(
              onPressed: () async {
                Get.back();
                openAppSettings();
              },
              child: Text(StringConstant.grant),
            ),
          ],
        );
      },
    );
  }

  void saveImage() {
    captureAndSaveQRImage();
  }

  void showEditMenu() {
    showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32.0),
          topLeft: Radius.circular(32.0),
        ),
      ),
      context: Get.context!,
      builder: (context) {
        return Column(
          children: [
            ListTile(
              title: Text(StringConstant.customize),
              trailing: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close_outlined),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialPicker(
                  onColorChanged: (newColor) {
                    updateColor(newColor);
                  },
                  pickerColor: currentColor.value,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /* void showEditMenu() {
    showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32.0),
          topLeft: Radius.circular(32.0),
        ),
      ),
      context: Get.context!,
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time_outlined),
                label: 'Test',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time_outlined),
                label: 'Test',
              ),
            ],
          ),
          body: DefaultTabController(
            length: 5,
            initialIndex: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  labelColor: Colors.red,
                  tabs: <Widget>[
                    Tab(
                      icon: const Icon(Icons.edit),
                      child: Text(StringConstant.color),
                    ),
                    Tab(
                      icon: const Icon(Icons.note_add),
                      child: Text(StringConstant.customize),
                    ),
                    Tab(
                      icon: const Icon(Icons.note_add),
                      child: Text(StringConstant.customize),
                    ),
                    Tab(
                      icon: const Icon(Icons.note_add),
                      child: Text(StringConstant.customize),
                    ),
                    Tab(
                      icon: const Icon(Icons.note_add),
                      child: Text(StringConstant.customize),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: [
                        MaterialPicker(
                          onColorChanged: (newColor) {
                            updateColor(newColor);
                          },
                          pickerColor: currentColor.value,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('FileName'),
                            ),
                          ),
                        ),
                        Text('Test'),
                        Text('Test'),
                        Text('Test'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        */ /*return Column(
          children: [
            ListTile(
              title: Text(StringConstant.customize),
              trailing: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close_outlined),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(StringConstant.color),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(StringConstant.customize),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: MaterialPicker(
                    onColorChanged: (newColor) {
                      updateColor(newColor);
                    },
                    pickerColor: currentColor.value,
                  ),
                ),
              ),
            ),
          ],
        );*/ /*
      },
    );
  }*/

}
