import 'package:flutter/material.dart';
import 'package:qr_code_scanner/constants/string_constant.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(StringConstant.download),
    );
  }
}
