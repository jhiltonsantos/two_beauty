import 'dart:async';

import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  void _goNextScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(introRoute, (route) => false);
  }

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNextScreen);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.purple_200,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorManager.purple_200,
              ColorManager.purple_300,
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SafeArea(child: SizedBox(height: 50)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      InitialStrings.nameAppUpper,
                      style: TextStyles.splashText(),
                    ),
                  ),
                ],
              ),
              Center(
                  child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.logoCoquinhaImage),
                    fit: BoxFit.contain,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
