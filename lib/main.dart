import 'package:Platypus/bottom.dart';
import 'package:bottom_animation/source/bottomnav_item.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  var cIndex;
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
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xFF294C60),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Platypus Send',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'CascadiaCode',
            ),
          ),
        ),
        backgroundColor: const Color(0xFF294C60),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: 300,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(20),
                dashPattern: const [20, 20],
                color: Colors.white,
                strokeWidth: 5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const <Widget>[
                      Icon(
                        Icons.cloud_upload_outlined,
                        color: Colors.white,
                        size: 150,
                      ),
                      Text(
                        'Click to upload Files',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'CascadiaCode',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
            fontFamily: "CascadiaCode",
          ),
          itemHoverWidth: 135,
          itemHoverBorderRadius: 20,
          hoverAlignmentDuration: 300,
        ),
      ),
    );
  }
}
