import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';
import 'package:registration_test/features/presentation/pages/login_screen.dart';
import 'package:registration_test/features/presentation/pages/main_shell_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: LoginRoute.page, path: '/'),
      AutoRoute(page: MainShellRoute.page, path: '/main-shell'),
    ];
  }
}
