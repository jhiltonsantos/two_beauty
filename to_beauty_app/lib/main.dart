import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_beauty_app/src/pages/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const SplashPage());
}
