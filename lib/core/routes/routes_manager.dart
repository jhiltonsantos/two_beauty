// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/injection/injection.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/home_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/intro_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/login_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/signup_page.dart';
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

      case signupRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SignupCubit>(
                  create: (_) => getIt(),
                  child: const SignupPage(),
                ),
            settings: const RouteSettings(name: signupRoute));

      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginCubit>(
                  create: (_) => getIt(),
                  child: const LoginPage(),
                ),
            settings: const RouteSettings(name: loginRoute));
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<HomeCubit>(
                  create: (_) => getIt(),
                  child: const HomePage(),
                ));
      default:
        return errorPage;
    }
  }
}
