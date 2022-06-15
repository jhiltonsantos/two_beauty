import 'dart:async';

import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/splash_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  void _goNextScreen() {
    Navigator.of(context).pushReplacementNamed(introRoute);
  }

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNextScreen);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashWidget();
  }
}
