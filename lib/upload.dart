import 'dart:io';

import 'package:Platypus/alert.dart';
import 'package:Platypus/network.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  void pickFiles() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Alert(
            content: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('No file selected',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'CascadeCode',
                        color: Colors.white)),
              ),
            ],
          );
        },
      );
    }
    setState(() {
      if (result != null) {
        ApiClient.uploadFile(file!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: InkWell(
        onTap: () {
          if (Platform.isAndroid) {
            pickFiles();
          }
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [20, 20],
          color: Colors.white,
          strokeWidth: 5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.white,
                  size: 150,
                ),
                Text(
                  'Click to upload Files',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'CascadeCode',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
