// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assistent_app/data/models/weather/weather_model.dart' as _i6;
import 'package:assistent_app/pages/loading/loading_page.dart' as _i1;
import 'package:assistent_app/pages/main/main_page.dart' as _i2;
import 'package:assistent_app/pages/settings/settings_page.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.MainPage(
          key: args.key,
          weatherModel: args.weatherModel,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoadingPage]
class LoadingRoute extends _i4.PageRouteInfo<void> {
  const LoadingRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i4.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i5.Key? key,
    required _i6.WeatherModel weatherModel,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            weatherModel: weatherModel,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i4.PageInfo<MainRouteArgs> page =
      _i4.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.weatherModel,
  });

  final _i5.Key? key;

  final _i6.WeatherModel weatherModel;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, weatherModel: $weatherModel}';
  }
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
