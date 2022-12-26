import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'alert.dart';

class MyListItem extends StatefulWidget {
  final String fileName;
  final String fileURL;

  const MyListItem({super.key, required this.fileName, required this.fileURL});

  @override
  State<MyListItem> createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Alert(
                  content: [
                    BarcodeWidget(
                      barcode: Barcode.qrCode(), // Barcode type and settings
                      data: widget.fileURL, // Content
                      width: 200,
                      height: 200,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                      height: 20,
                    ),
                    SelectableText(
                      widget.fileURL,
                      style: const TextStyle(
                        fontFamily: 'CascadeCode',
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              });
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(0, 1),
                            blurRadius: 3,
                            spreadRadius: 2,
                          )
                        ]),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: const Icon(
                              Icons.file_copy,
                              size: 50,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    widget.fileName,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
              ],
            )));
  }
}
