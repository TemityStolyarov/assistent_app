import 'package:assistent_app/core/constants.dart';
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
    if (weather == 'sun') {
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
    if (weather == 'cloud') {
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
    if (weather == 'night_cloud') {
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
    if (weather == 'rain') {
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
    if (weather == 'snow') {
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
    if (weather == 'thunder') {
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
