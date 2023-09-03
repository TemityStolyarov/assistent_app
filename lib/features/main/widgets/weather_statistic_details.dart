import 'package:assistent_app/api/weather_model.dart';
import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/features/main/widgets/custom_text.dart';
import 'package:assistent_app/features/main/widgets/custom_tile_container.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherStatisticDetails extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherStatisticDetails({super.key, required this.weatherModel});

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
                  text: '${weatherModel.fact.windSpeed} м/с',
                  fontSize: 15.sp,
                  fontWeight: fontWeightMedium,
                ),
                const Spacer(),
                SizedBox(
                  width: 206.sp,
                  child: CustomText(
                    text: S.of(context).windSelect(weatherModel.fact.windDir),
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
                  text: '${weatherModel.fact.humidity}%',
                  fontSize: 15.sp,
                  fontWeight: fontWeightMedium,
                ),
                const Spacer(),
                SizedBox(
                  width: 206.sp,
                  child: CustomText(
                    text: weatherModel.fact.humidity > 65
                        ? 'Высокая влажность'
                        : weatherModel.fact.humidity > 45
                            ? 'Умеренная влажность'
                            : 'Пониженная влажность',
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
                  text: 'УФ ${weatherModel.forecasts[0].parts['day']!.uvIndex}',
                  fontSize: 15.sp,
                  fontWeight: fontWeightMedium,
                ),
                const Spacer(),
                SizedBox(
                  width: 206.sp,
                  child: CustomText(
                    text: weatherModel.forecasts[0].parts['day']!.uvIndex! > 4
                        ? 'Высокий УФ индекс'
                        : weatherModel.forecasts[0].parts['day']!.uvIndex! > 2
                            ? 'Умеренный УФ индекс'
                            : 'Низкий УФ индекс',
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
