import 'package:assistent_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;
  final TextAlign align;
  final TextOverflow overflow;
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = fontWeightRegular,
    this.color = fontColorTitle,
    this.decoration = TextDecoration.none,
    this.align = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: overflow,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
