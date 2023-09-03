import 'package:assistent_app/generated/l10n.dart';
import 'package:assistent_app/pages/main/widgets/custom_text.dart';
import 'package:assistent_app/pages/main/widgets/custom_tile_container.dart';
import 'package:assistent_app/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoTasksTodayContainer extends StatelessWidget {
  final bool isAllTaskHidden;
  const NoTasksTodayContainer({
    super.key,
    required this.isAllTaskHidden,
  });

  @override
  Widget build(BuildContext context) {
    final S locale = S.of(context);
    if (isAllTaskHidden) {
      return GestureDetector(
        child: TileContainer(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.sp,
                ),
                child: Column(
                  children: [
                    CustomText(
                      text: locale.hiddenTasks,
                      fontSize: 14.sp,
                      fontWeight: fontWeightMedium,
                    ),
                    SizedBox(height: 5.sp),
                    CustomText(
                      text: locale.showMore,
                      fontSize: 12.sp,
                      color: fontColorSubtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          //TODO
        },
      );
    } else {
      return GestureDetector(
        child: TileContainer(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.sp,
                ),
                child: Column(
                  children: [
                    CustomText(
                      text: locale.noTasks,
                      fontSize: 14.sp,
                      fontWeight: fontWeightMedium,
                    ),
                    SizedBox(height: 5.sp),
                    CustomText(
                      text: locale.showMoreOtherDays,
                      fontSize: 12.sp,
                      color: fontColorSubtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          //TODO
        },
      );
    }
  }
}
