import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:to_beauty_app/presentation/resources/assets_manager.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  Timer? _timer;

  _goNextScreen() {
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNextScreen);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();

    /* _startDelay(); */
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.splashBackgroud,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SafeArea(child: SizedBox(height: 50)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Container(
                  height: 260,
                  width: 800,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.logoRemoveBgImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
                const SizedBox(
                  height: 100,
                ),
                const Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: FlareActor(
                      ImageFlareAssets.loadingFlare,
                      animation: 'loading',
                      fit: BoxFit.contain,
                    ),
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
        ));
  }
}
