import 'package:flutter/material.dart';
import 'package:tentwenty_task/utils/color.dart';
class HeaderTextStyle extends StatelessWidget {
  String text;
  HeaderTextStyle({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: bottomColor,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
