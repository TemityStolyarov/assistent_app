import 'package:assistent_app/data/models/weather/weather_model.dart';
import 'package:assistent_app/pages/main/widgets/custom_text.dart';
import 'package:assistent_app/pages/main/widgets/custom_tile_container.dart';
import 'package:assistent_app/utils/color_palette.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherStatisticDetails extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherStatisticDetails({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final S locale = S.of(context);
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
                  locale.windAsset,
                  height: 24.sp,
                ),
                SizedBox(width: 8.sp),
                CustomText(
                  text: '${weatherModel.fact.windSpeed} ${locale.windSpeed}',
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
                  locale.dropAsset,
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
                        ? locale.highHumid
                        : weatherModel.fact.humidity > 45
                            ? locale.mediumHumid
                            : locale.lowHumid,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.sp),
            Row(
              children: [
                Image.asset(
                  locale.sunAsset,
                  height: 24.sp,
                ),
                SizedBox(width: 8.sp),
                CustomText(
                  text:
                      '${locale.uv} ${weatherModel.forecasts[0].parts['day']!.uvIndex}',
                  fontSize: 15.sp,
                  fontWeight: fontWeightMedium,
                ),
                const Spacer(),
                SizedBox(
                  width: 206.sp,
                  child: CustomText(
                    text: weatherModel.forecasts[0].parts['day']!.uvIndex! > 4
                        ? locale.highUV
                        : weatherModel.forecasts[0].parts['day']!.uvIndex! > 2
                            ? locale.mediumUV
                            : locale.lowUV,
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
