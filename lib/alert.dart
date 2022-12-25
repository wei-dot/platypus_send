import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  final List<Widget> content;

  const Alert({Key? key, required this.content}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: const Color(0XFF294C60),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...widget.content,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(Colors.white.value),
              ),
              child: const Text('確定',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
