import 'package:assistent_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  final Scaffold scaffold;
  const CustomSafeArea({
    super.key,
    required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(child: scaffold),
    );
  }
}
