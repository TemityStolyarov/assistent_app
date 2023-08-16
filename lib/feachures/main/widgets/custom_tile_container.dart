import 'package:assistent_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileContainer extends StatelessWidget {
  final Widget child;
  const TileContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
        color: backgroundBox,
      ),
      child: child,
    );
  }
}
