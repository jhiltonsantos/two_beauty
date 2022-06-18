import 'dart:io';

import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class CloseAppWidget extends StatefulWidget {
  const CloseAppWidget({Key? key}) : super(key: key);

  @override
  State<CloseAppWidget> createState() => _CloseAppWidgetState();
}

class _CloseAppWidgetState extends State<CloseAppWidget> {
  @override
  void initState() {
    super.initState();
    closeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white_200,
    );
  }

  void closeApp() {
    exit(0);
  }
}
