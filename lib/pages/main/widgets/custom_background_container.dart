import 'package:assistent_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final String weather;
  final Widget child;
  const BackgroundContainer({
    required this.weather,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (weather == 'clear' || weather == 'partly-cloudy') {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundShiny, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
    }
    if (weather == 'cloudy') {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundCloudy, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
    }
    if (weather == 'overcast') {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundNightCloudy, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
    }
    if (weather == 'light-rain' ||
        weather == 'rain' ||
        weather == 'heavy-rain' ||
        weather == 'showers' ||
        weather == 'hail') {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundRainy, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
    }
    if (weather == 'snow' ||
        weather == 'wet-snow' ||
        weather == 'light-snow' ||
        weather == 'snow_showers') {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundSnowy, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
    }
    if (weather == 'thunderstorm' ||
        weather == 'thunderstorm-with-rain' ||
        weather == 'thunderstorm-with-hail') {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundThunder, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [backgroundElseWeather, backgroundEnd],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
