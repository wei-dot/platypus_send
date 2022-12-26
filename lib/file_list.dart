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
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Uploaded File',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'CascadeCode',
                fontSize: 20,
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
