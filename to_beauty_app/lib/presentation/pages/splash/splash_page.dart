import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:to_beauty_app/presentation/resources/assets_manager.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  _goNextScreen() {
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNextScreen);
  }

  @override
  void initState() {
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
    return const MaterialApp(
      home: SplashScreenWidget(),
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.splashBackgroud,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Container(
              height: 180,
              width: 180,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                image: DecorationImage(
                  image: AssetImage(ImageAssets.logoImage),
                  fit: BoxFit.contain,
                ),
              ),
            )),
            const SizedBox(
              height: 65,
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
            )
          ],
        ));
  }
}
