import 'package:flutter/material.dart';
import 'halamanChat.dart';

class isiChat extends StatefulWidget {
  final String title;

  isiChat({required this.title});

  @override
  State<isiChat> createState() => _isiChatState();
}

class _isiChatState extends State<isiChat> {
  bool selesai = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 111, 39, 39),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              decoration: selesai ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: selesai
              ? Icon(
            Icons.check,
          )
              : SizedBox(),
        ),
      ),
    );
  }
}