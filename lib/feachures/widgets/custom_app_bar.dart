import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/core/utils/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.sp,
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      // decoration: BoxDecoration(
      //   color: backgroundColor,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.1),
      //       offset: Offset(0, 5.sp),
      //       blurRadius: 6.sp,
      //       spreadRadius: 0,
      //     ),
      //   ],
      // ),
      child: Row(
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: backgroundElseWeather,
                splashRadius: 0.0001,
                iconSize: 18.sp,
                onPressed: () {
                  AutoRouter.of(context).pushAndPopUntil(const MainRoute(),
                      predicate: (route) => true);

                  SystemChrome.setSystemUIOverlayStyle(
                    const SystemUiOverlayStyle(
                      systemNavigationBarColor: backgroundEnd,
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: fontWeightMedium,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
