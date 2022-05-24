// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/intro_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/splash_page.dart';

class RouteGenerator {
  static final errorPage = MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(child: Text('Error Routes')),
    );
  });

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final routeName = settings.name;

    switch (routeName) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: const RouteSettings(name: splashRoute),
        );

      case introRoute:
        return MaterialPageRoute(
          builder: (_) => const IntroPage(),
          settings: const RouteSettings(name: introRoute),
        );

      default:
        return errorPage;
    }
  }
}
