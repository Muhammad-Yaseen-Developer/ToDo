// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  MyText(
      {super.key,
      required this.title,
      this.size = 15,
      this.color = Colors.white,
      required this.check});

  String title;
  double? size;
  Color? color;
  bool check;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: size,
          decoration: check ? TextDecoration.lineThrough : TextDecoration.none),
    );
  }
}
