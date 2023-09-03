import 'package:assistent_app/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String subtitle;
  final double? borderRadius;
  final Color? buttonColor;
  final double? elevation;
  final double? width;
  final double? height;
  final double? fontSize;

  const RoundedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.subtitle = '',
    this.borderRadius,
    this.buttonColor,
    this.elevation,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    if (subtitle == '') {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          fixedSize: Size(width ?? 165.sp, height ?? 50.sp),
          backgroundColor: buttonColor ?? backgroundBox,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeightMedium,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          fixedSize: Size(width ?? 165.sp, height ?? 50.sp),
          backgroundColor: buttonColor ?? backgroundBox,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize ?? 14.sp,
                fontWeight: fontWeightMedium,
              ),
            ),
            SizedBox(height: 4.sp),
            Text(
              subtitle,
              style: TextStyle(
                color: fontColorSubtitle,
                fontSize: fontSize ?? 12.sp,
                fontWeight: fontWeightRegular,
              ),
            ),
          ],
        ),
      );
    }
  }
}
