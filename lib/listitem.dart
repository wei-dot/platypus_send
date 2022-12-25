import 'package:flutter/material.dart';

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
    return Container(
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
                          size: 70,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.fileName,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${(100 / 1024).ceil()} KB',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 5,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue.shade50,
                            ),
                            // child: LinearProgressIndicator(
                            //   value: loadingController.value,
                            // )
                          ),
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
        ));
  }
}
