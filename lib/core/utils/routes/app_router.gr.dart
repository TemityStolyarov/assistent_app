// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assistent_app/feachures/loading/pages/loading_page.dart' as _i1;
import 'package:assistent_app/feachures/main/pages/main_page.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoadingPage]
class LoadingRoute extends _i3.PageRouteInfo<void> {
  const LoadingRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
