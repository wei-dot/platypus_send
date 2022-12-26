import 'package:Platypus/network.dart';
import 'package:flutter/material.dart';

import 'alert.dart';

class MySettingMenuItem {
  final String text;
  final IconData icon;

  const MySettingMenuItem({
    required this.text,
    required this.icon,
  });
}

class MySettingMenuItems {
  static const List<MySettingMenuItem> firstItems = [clear, setting, about];

  static const setting =
      MySettingMenuItem(text: 'Setting', icon: Icons.settings);
  static const about = MySettingMenuItem(text: 'About', icon: Icons.info);
  static const clear = MySettingMenuItem(text: 'Clear', icon: Icons.clear);

  static final myController = TextEditingController();

  static Widget buildItem(MySettingMenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            fontFamily: 'CascadeCode',
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MySettingMenuItem item) {
    RegExp exp = RegExp(r'(?:(?:https?|ftp)://)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    switch (item) {
      case MySettingMenuItems.setting:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert(
              content: [
                const Text('Current Server:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'CascadeCode',
                        color: Colors.white)),
                SelectableText(
                  ApiClient.path,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'CascadeCode',
                      color: Colors.white),
                ),
                TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Enter your Custom Server',
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'CascadeCode',
                        color: Colors.white),
                    suffixStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'CascadeCode',
                        color: Colors.white),
                    prefixStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'CascadeCode',
                        color: Colors.white),
                    errorText:
                        exp.hasMatch(myController.text) ? null : 'Invalid URL',
                  ),
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'CascadeCode',
                      color: Colors.white),
                ),
              ],
            );
          },
        );
        //Do something
        break;
      case MySettingMenuItems.about:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Alert(
              content: [
                Text('開發人員: silver,wei-dot,221934420a\n版本: 1.0.0\n項目位置:',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'CascadeCode',
                        color: Colors.white)),
                SelectableText(
                  'https://github.com/wei-dot/platypus_send',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'CascadeCode',
                      color: Colors.white),
                )
              ],
            );
          },
        );
        break;
      case MySettingMenuItems.clear:
        //Do something
        ApiClient.clearFiles();
        break;
    }
  }
}
