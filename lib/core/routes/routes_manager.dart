// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/injection/injection.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/appointment/appointment_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/bottom_navy/bottom_navy_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_owner/create_owner_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/appointment_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/bottom_navy_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/create_owner_form_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/create_store_address_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/create_store_intro_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/home_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/intro_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/login_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/signup_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/splash_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/store_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/close_app_widget.dart';

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
            builder: (_) => BlocProvider<SplashCubit>(
                  create: (_) => getIt(),
                  child: const SplashPage(),
                ),
            settings: const RouteSettings(name: splashRoute));

      case introRoute:
        return MaterialPageRoute(
          builder: (_) => const IntroPage(),
          settings: const RouteSettings(name: introRoute),
        );

      case bottomNavyRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<BottomNavyCubit>(
                  create: (_) => getIt(),
                  child: const BottomNavyPage(),
                ),
            settings: const RouteSettings(name: bottomNavyRoute));

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

      case detailStore:
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => BlocProvider<StoreCubit>(
                    create: (_) => getIt(),
                    child: StorePage(id: args),
                  ));
        }
        return errorPage;

      case appointmentRoute:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<AppointmentCubit>(
              create: (_) => getIt(),
              child: AppointmentPage(id: args),
            ),
          );
        }
        return errorPage;

      case ownerFormRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CreateOwnerCubit>(
            create: (_) => getIt(),
            child: const CreateOwnerFormPage(),
          ),
        );

      case registerStoreIntroRoute:
        return MaterialPageRoute(
          builder: (_) => const CreateStoreIntroPage(),
          settings: const RouteSettings(name: registerStoreIntroRoute),
        );

      case registerStoreRoute:
        if (args is List) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<CreateStoreCubit>(
              create: (_) => getIt(),
              child: CreateStoreAddressPage(listArgs: args),
            ),
            settings: const RouteSettings(name: registerStoreRoute),
          );
        }
        return errorPage;

      case closeAppRoute:
        return MaterialPageRoute(builder: (_) => const CloseAppWidget());

      default:
        return errorPage;
    }
  }
}
