import 'package:flutter/material.dart';

import 'alert.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [home, about];

  static const home = MenuItem(text: 'Setting', icon: Icons.settings);
  static const about = MenuItem(text: 'About', icon: Icons.info);

  static Widget buildItem(MenuItem item) {
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

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
        //Do something
        break;
      case MenuItems.about:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Alert(
              message: '開發人員: silver,weidot,221934420a\n版本: 1.0.0\n項目位置:\nhttps://github.com/wei-dot/platypus_send',
            );
          },
        );
        break;
    }
  }
}
