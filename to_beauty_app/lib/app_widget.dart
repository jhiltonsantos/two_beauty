import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/pages/home/home_page.dart';
import 'package:to_beauty_app/src/pages/initial/initial_page.dart';
import 'package:to_beauty_app/src/pages/login/login_page.dart';
import 'package:to_beauty_app/src/pages/sign_up/sign_up_page.dart';
import 'package:to_beauty_app/src/pages/store/create_store_page.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2Beauty',
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialPage(),
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
