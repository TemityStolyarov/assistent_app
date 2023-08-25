import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:assistent_app/feachures/main/widgets/custom_tile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherStatisticHeader extends StatelessWidget {
  const WeatherStatisticHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/thunder.png',
          height: 28.sp,
        ),
        SizedBox(width: 10.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '28º',
              fontSize: 14.sp,
            ),
            CustomText(
              text: 'Гроза',
              fontSize: 14.sp,
              fontWeight: fontWeightMedium,
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
              text: 'Макс.: 31º, Мин.: 25º',
              fontSize: 14.sp,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/pin_icon.png',
                  height: 14.sp,
                ),
                SizedBox(width: 3.sp),
                CustomText(
                  text: 'Ростов-на-Дону, Россия',
                  fontSize: 14.sp,
                  fontWeight: fontWeightMedium,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class WeatherStatisticDetails extends StatelessWidget {
  const WeatherStatisticDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return TileContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.sp,
          horizontal: 19.sp,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/wind_icon.png',
                  height: 24.sp,
                ),
                SizedBox(width: 8.sp),
                CustomText(
                  text: '2 м/с',
                  fontSize: 15.sp,
                  fontWeight: fontWeightMedium,
                ),
                const Spacer(),
                SizedBox(
                  width: 206.sp,
                  child: CustomText(
                    text: 'Ветер северо-восточный',
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.sp),
            Row(
              children: [
                Image.asset(
                  'assets/images/drop_icon.png',
                  height: 24.sp,
                ),
                SizedBox(width: 8.sp),
                CustomText(
                  text: '100%',
                  fontSize: 15.sp,
                  fontWeight: fontWeightMedium,
                ),
                const Spacer(),
                SizedBox(
                  width: 206.sp,
                  child: CustomText(
                    text: 'Высокая влажность',
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.sp),
            Row(
              children: [
                Image.asset(
                  'assets/images/sun_icon.png',
                  height: 24.sp,
                ),
                SizedBox(width: 8.sp),
                CustomText(
                  text: 'УФ 3',
                  fontSize: 15.sp,
                  fontWeight: fontWeightMedium,
                ),
                const Spacer(),
                SizedBox(
                  width: 206.sp,
                  child: CustomText(
                    text: 'Умеренный УФ индекс',
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
