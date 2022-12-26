import 'package:Platypus/bottom.dart';
import 'package:Platypus/file_list.dart';
import 'package:Platypus/network.dart';
import 'package:Platypus/search_result.dart';
import 'package:Platypus/upload.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:bottom_animation/source/bottomnav_item.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'setting_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Platypus Send',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF294C60),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var searchingKeyWord = '';
  var items = <BottomNavItem>[
    BottomNavItem(
      title: 'upload',
      widget: const Icon(
        Icons.cloud_upload_outlined,
        color: Colors.white,
      ),
    ),
    BottomNavItem(
        title: 'list',
        widget: const Icon(
          Icons.list_alt_outlined,
          color: Colors.white,
        )),
  ];

  var cIndex = 0;
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0XFF294C60),
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Color(0XFF294C60),
    statusBarColor: Color(0xFF213B4A),
    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark,
    // For Android (dark icons)
    statusBarBrightness: Brightness.light,
    // For iOS (dark icons)
  );

  @override
  void initState() {
    cIndex = 0;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    ApiClient.loadUploadFiles();
  }

  Widget _body() {


    switch (cIndex) {
      case 0:
        return const Upload();
      case 1:
        return const FileList();
      // case 98:
      //   SearchResult searchResult = SearchResult(searchingKeyWord);
      //   searchResult.updateKeyword(searchingKeyWord);
      //   return searchResult;
      case 99:
        SearchResult searchResult = SearchResult(searchingKeyWord);
        searchResult.updateKeyword(searchingKeyWord);
        return searchResult;
      default:
        return const Upload();
    }
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF294C60),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Platypus Send',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'CascadeCode',
            ),
          ),
        ),
        backgroundColor: const Color(0xFF294C60),
        elevation: 0,
        actions: <Widget>[
          /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
          /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
          AnimSearchBar(
            rtl: true,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.transparent,
            boxShadow: false,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
            onSubmitted: (String s) {
              setState(() {
                searchingKeyWord = textController.text;
                cIndex = 99;
              });
            },
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: const Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.white,
                ),
                customItemsHeights: [
                  ...List<double>.filled(MySettingMenuItems.firstItems.length, 48),
                ],
                items: [
                  ...MySettingMenuItems.firstItems.map(
                    (item) => DropdownMenuItem<MySettingMenuItem>(
                      value: item,
                      child: MySettingMenuItems.buildItem(item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  MySettingMenuItems.onChanged(context, value as MySettingMenuItem);
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _body(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: MyBottom(
          selectedIndex: cIndex,
          items: items,
          backgroundColor: const Color(0xFF213B4A),
          onItemSelect: (value) {
            setState(() {
              cIndex = value;
            });
          },
          itemHoverColor: const Color(0xFF4A819F),
          itemHoverColorOpacity: .5,
          activeIconColor: Colors.black,
          deActiveIconColor: Colors.black38,
          barHeight: 90,
          barRadius: 20,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "CascadeCode",
          ),
          itemHoverWidth: 135,
          itemHoverBorderRadius: 20,
          hoverAlignmentDuration: 300,
        ),
      ),
    );
  }
}
