import 'package:assistent_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = fontWeightRegular,
    this.color = fontColorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
