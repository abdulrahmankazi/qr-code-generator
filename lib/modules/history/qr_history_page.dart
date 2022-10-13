import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/string_constant.dart';

import 'qr_history_controller.dart';

class QRHistoryPage extends StatelessWidget {
  QRHistoryPage({Key? key}) : super(key: key);
  final qRHistoryController = Get.put(QRHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.appName),
      ),
      body: Center(
        child: Text('History'),
      ),
    );
  }
}
