import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    print("SearchResult: $keyword");
    return Container(
      child: Text("以下為字詞$keyword的搜尋結果"),
    );
  }
}