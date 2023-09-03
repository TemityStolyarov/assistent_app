import 'package:assistent_app/data/api/weather_api.dart';
import 'package:assistent_app/data/models/task/task_model.dart';
import 'package:assistent_app/utils/color_palette.dart';
import 'package:assistent_app/navigation/routes/app_router.gr.dart';
import 'package:assistent_app/pages/widgets/error_container.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  Future<Position> _determinePosition(S locale) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(locale.locationError);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(locale.locationDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(locale.locationPermDenied);
    }
    return await Geolocator.getCurrentPosition();
  }

  _initSettings(BuildContext context) async {
    final locale = S.of(context);
    if (!Hive.isBoxOpen('tasks')) {
      final appDocumentDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDirectory.path);
      Hive.registerAdapter(TaskModelAdapter());
      await Hive.openBox('tasks');
    }

    final Position geolocation = await _determinePosition(locale);
    WeatherAPI weatherAPI = WeatherAPI();
    final weatherModel = await weatherAPI.getWeather(
      latitude: geolocation.latitude,
      longitude: geolocation.longitude,
      locale: locale,
    );
    if (context.mounted) {
      AutoRouter.of(context).push(
        MainRoute(
          weatherModel: weatherModel,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initSettings(context),
      builder: ((context, snapshot) {
        if (!snapshot.hasError) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [backgroundElseWeather, backgroundEnd],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(
                      color: fontColorTitle,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return ErrorContainer(
            errorMessage: snapshot.error.toString(),
            isScaffoldNeeded: true,
          );
        }
      }),
    );
  }
}
