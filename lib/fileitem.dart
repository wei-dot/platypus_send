import 'package:Platypus/network.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class MyFileItems {
  static Widget buildItem(UploadFile item) {
    return Column(
      children: [
        BarcodeWidget(
          barcode: Barcode.qrCode(), // Barcode type and settings
          data: item.fileURL, // Content
          width: 200,
          height: 200,
        ),
        const SizedBox(
          width: 10,
        ),
        SelectableText(
          item.fileURL,
          style: const TextStyle(
            fontFamily: 'CascadeCode',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
