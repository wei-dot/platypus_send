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
          fileName: 'temp1',
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
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  return MyListItem(
                    fileName: _files[index].fileName,
                    fileURL: _files[index].fileURL,
                  );
                },
              ),
            )
          ],
        ));
  }
}
