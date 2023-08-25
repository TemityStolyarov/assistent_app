import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:assistent_app/feachures/main/widgets/custom_tile_container.dart';
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
                      text: 'Задачи на сегодня спрятаны :)',
                      fontSize: 14.sp,
                      fontWeight: fontWeightMedium,
                    ),
                    SizedBox(height: 5.sp),
                    CustomText(
                      text: 'Коснитесь для просмотра списка всех задач',
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
          print('todo');
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
                      text: 'На сегодня задач нет',
                      fontSize: 14.sp,
                      fontWeight: fontWeightMedium,
                    ),
                    SizedBox(height: 5.sp),
                    CustomText(
                      text: 'Коснитесь для просмотра задач на другие дни',
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
          print('todo');
          //TODO
        },
      );
    }
  }
}
