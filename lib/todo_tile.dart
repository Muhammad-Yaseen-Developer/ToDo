// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/text_widget.dart';

class TodoTile extends StatelessWidget {
  TodoTile(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.text});

  bool value;
  String text;

  void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.cyan,
        ),
        height: 70,
        width: 4115,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.cyan,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: MyText(
                  title: text,
                  check: value,
                ))
          ],
        ),
      ),
    );
  }
}
