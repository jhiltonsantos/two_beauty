import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'package:to_beauty_app/app_widget.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
    return Stack(
      children: [
        SplashScreenView(
          duration: 2000,
          backgroundColor: Colors.white,
          navigateRoute: const AppWidget(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Container(
              height: 260,
              width: 260,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            )),
            const SizedBox(height: 50),
            Center(
                child: Container(
              width: 120,
              height: 120,
              child: const FlareActor(
                "assets/images/loading.flr",
                animation: 'loading',
                fit: BoxFit.contain,
              ),
            ))
          ],
        )
      ],
    );
  }
}
