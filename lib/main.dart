import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:two_beauty/core/app/app_widget.dart';
import 'package:two_beauty/core/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  configureDependencies();
  runApp(const AppWidget());
}
