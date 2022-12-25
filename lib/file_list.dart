import 'package:flutter/material.dart';

class FileList extends StatefulWidget {
  const FileList({super.key});

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Uploaded File',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 15, ),),
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        spreadRadius: 2,
                      )
                    ]
                ),
                child: Row(
                  children: [
                    // ClipRRect(
                    //     borderRadius: BorderRadius.circular(8),
                    //     child: Image.file(_file!, width: 70,)
                    // ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("test",
                            style: TextStyle(fontSize: 13, color: Colors.black),),
                          SizedBox(height: 5,),
                          Text('${(100 / 1024).ceil()} KB',
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                          ),
                          SizedBox(height: 5,),
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
                    SizedBox(width: 10,),
                  ],
                )
            ),
            SizedBox(height: 20,),
            // MaterialButton(
            //   minWidth: double.infinity,
            //   height: 45,
            //   onPressed: () {},
            //   color: Colors.black,
            //   child: Text('Upload', style: TextStyle(color: Colors.white),),
            // )
          ],
        ));
  }
}
