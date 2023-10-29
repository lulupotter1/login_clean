import 'package:flutter/material.dart';
import 'package:registration_test/config/router/app_router.dart';
import 'package:registration_test/config/themes/app_themes.dart';
import 'package:registration_test/core/constant/constants.dart';
import 'package:registration_test/core/app/app_injection.dart';

void main() {
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter router = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      theme: theme(),
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
