import 'package:flutter/material.dart';

import 'listitem.dart';
import 'network.dart';

class FileList extends StatefulWidget {
  const FileList({super.key});

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  final List<UploadFile> _files = ApiClient.files;

  @override
  Widget build(BuildContext context) {
    ApiClient.files.addAll([
      UploadFile(
          fileName: 'test',
          filePath: "C:\\Users\\user\\Desktop\\test.txt",
          fileURL: 'image'),
      UploadFile(
          fileName: 'test',
          filePath: "C:\\Users\\user\\Desktop\\test.txt",
          fileURL: 'image')
    ]);
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uploaded File',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ..._files.map((e) => MyListItem(
                  fileName: e.fileName,
                  fileURL: e.fileURL,
                ))
          ],
        ));
  }
}
