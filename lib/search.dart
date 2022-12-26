import 'package:flutter/material.dart';

class SearchResult2 extends StatefulWidget {
  String keyword = "";

  SearchResult2(this.keyword, {super.key});

  @override
  State<SearchResult2> createState() => _SearchResultState(keyword);
}

class _SearchResultState extends State<SearchResult2> {
  String keyword = "";

  _SearchResultState(this.keyword);

  @override
  Widget build(BuildContext context) {
    print("SearchResult: $keyword");
    return Container(
      child: Text("以下為字詞$keyword的搜尋結果",
          style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
