import 'package:flutter/material.dart';
import 'package:to_beauty_app/presentation/pages/home/home_page.dart';
import 'package:to_beauty_app/presentation/pages/initial/initial_page.dart';
import 'package:to_beauty_app/presentation/pages/login/login_page.dart';
import 'package:to_beauty_app/presentation/pages/maps/map_page.dart';
import 'package:to_beauty_app/presentation/pages/maps/place_list_viewmodel.dart';
import 'package:to_beauty_app/presentation/pages/sign_up/sign_up_page.dart';
import 'package:to_beauty_app/presentation/pages/splash/splash_page.dart';
import 'package:to_beauty_app/presentation/pages/store_create/create_store_page.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeRoute = "/home";
  static const String mapRoute = "/testMap";
  static const String registerStoreRoute = "/registerstore";
  static const String detailStore = "/detailStore";
  static const String profileAgenda = "/profileAgenda";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreenWidget());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.mapRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => PlaceListViewModel(),
            child: const MapPage(),
          ),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.registerStoreRoute:
        return MaterialPageRoute(builder: (_) => const CreateStorePage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
