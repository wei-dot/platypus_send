import 'package:Platypus/network.dart';
import 'package:flutter/material.dart';

import 'listitem.dart';
class SearchResult extends StatefulWidget {
  String keyword = "";
  SearchResult(this.keyword, {super.key});
  static get context => null;

  @override
  State<SearchResult> createState() => _SearchResultState(keyword);
  void updateKeyword(String newKeyword) {
    _SearchResultState.updateKeyword(newKeyword);
  }
}



class _SearchResultState extends State<SearchResult> {
  String keyword = "";
  _SearchResultState(this.keyword);
  static List<_SearchResultState> instances = [];

  @override
  void initState() {
    super.initState();
    instances.add(this);
  }

  @override
  void dispose() {
    instances.remove(this);
    super.dispose();
  }

  static void updateKeyword(String newKeyword) {
    for (_SearchResultState instance in instances) {
      instance.setState(() {
        instance.keyword = newKeyword;
      });
    }
  }

  final List<UploadFile> _files = ApiClient.files;
  List<UploadFile> _searchResult = [];
  //search file by keyword
  void searchFile(String keyword) {
    setState(() {
      _searchResult = [];
      for (UploadFile file in _files) {
        if (file.fileName.contains(keyword)) {
          _searchResult.add(file);
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    searchFile(keyword);
    return Container(
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search Result',
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
                  itemCount: _searchResult.length,
                  itemBuilder: (context, index) {
                    return MyListItem(
                      fileName: _searchResult[index].fileName,
                      fileURL: _searchResult[index].fileURL,
                    );
                  },
                ),
              )
            ],
          )
      ),
    );
  }
}