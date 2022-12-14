import 'package:Platypus/setting_menu.dart' as menu_item;
import 'package:flutter/material.dart';

import 'network.dart';

class Alert extends StatefulWidget {
  final List<Widget> content;

  const Alert({Key? key, required this.content}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  final myController = menu_item.MySettingMenuItems.myController;

  @override
  Widget build(BuildContext context) {
    RegExp exp = RegExp(r'(?:(?:https?|ftp)://)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: const Color(0XFF294C60),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...widget.content,
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(Colors.white.value),
                ),
                child: const Text('OK',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'CascadeCode',
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (myController.text.isNotEmpty &&
                      exp.hasMatch(myController.text)) {
                    ApiClient.setPath(myController.text);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
