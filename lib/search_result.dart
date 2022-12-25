import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  String keyword = "";
  SearchResult(this.keyword, {super.key});
  @override
  State<SearchResult> createState() => _SearchResultState(keyword);
}
class _SearchResultState extends State<SearchResult> {
  String keyword = "";
  _SearchResultState(this.keyword);
  @override
  Widget build(BuildContext context) {
    print("SearchResult: $keyword");
    return Container(
      child: Text("以下為字詞$keyword的搜尋結果"),
    );
  }
}