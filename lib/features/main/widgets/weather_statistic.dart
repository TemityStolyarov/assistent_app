import 'package:assistent_app/api/weather_model.dart';
import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/features/main/widgets/custom_text.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherStatistic extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherStatistic({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final weatherCondition = weatherModel
        .forecasts[0].parts['day_short']!.condition
        .replaceAll('-', '');
    return Row(
      children: [
        Image.asset(
          'assets/images/${weatherModel.forecasts[0].parts['day_short']!.condition}.png',
          height: 28.sp,
        ),
        SizedBox(width: 10.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '${weatherModel.fact.temp}º',
              fontSize: 14.sp,
            ),
            SizedBox(
              width: 125.sp,
              child: CustomText(
                text: S.of(context).weatherSelect(weatherCondition),
                fontSize: 14.sp,
                fontWeight: fontWeightMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
              text:
                  'Макс.: ${weatherModel.forecasts[0].parts['day']!.tempAvg}º, Мин.: ${weatherModel.forecasts[0].parts['night']!.tempAvg}º',
              fontSize: 14.sp,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/pin_icon.png',
                  height: 14.sp,
                ),
                SizedBox(width: 3.sp),
                CustomText(
                  text: weatherModel.geoObject.province.name,
                  fontSize: 14.sp,
                  fontWeight: fontWeightMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
