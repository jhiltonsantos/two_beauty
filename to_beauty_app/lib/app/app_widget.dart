import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_beauty_app/presentation/pages/maps/map_page.dart';
import 'package:to_beauty_app/presentation/pages/maps/place_list_viewmodel.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class AppWidget extends StatefulWidget {
  const AppWidget._internal();
  static const AppWidget instance = AppWidget._internal();
  factory AppWidget() => instance;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.mapRoute,
      title: AppStrings.nameAppUpper,
      theme: ThemeData(
        primaryColor: ColorManager.primaryColor,
        backgroundColor: Colors.white,
      ),
    );
  }
}
