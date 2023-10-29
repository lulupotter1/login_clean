// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MainShellRoute.name: (routeData) {
      final args = routeData.argsAs<MainShellRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainShellScreen(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
  };
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainShellScreen]
class MainShellRoute extends PageRouteInfo<MainShellRouteArgs> {
  MainShellRoute({
    Key? key,
    required UserEntity userData,
    List<PageRouteInfo>? children,
  }) : super(
          MainShellRoute.name,
          args: MainShellRouteArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'MainShellRoute';

  static const PageInfo<MainShellRouteArgs> page =
      PageInfo<MainShellRouteArgs>(name);
}

class MainShellRouteArgs {
  const MainShellRouteArgs({
    this.key,
    required this.userData,
  });

  final Key? key;

  final UserEntity userData;

  @override
  String toString() {
    return 'MainShellRouteArgs{key: $key, userData: $userData}';
  }
}
