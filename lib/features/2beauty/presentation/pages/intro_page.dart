import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed(closeAppRoute);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.white_200,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        InitialStrings.nameAppUpper,
                        style: TextStyles.titleApp(),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Center(
                      child: Text(
                        InitialStrings.subtitleMainScreen,
                        style: TextStyles.subtitleInitApp(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 100.0, horizontal: 24.0),
                child: Container(
                  height: 218.0,
                  width: 327.0,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(ImageAssets.introImage7),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    ButtonIntroApp(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(signupRoute),
                      styleButton: ButtonStyles.buttonPrimary(),
                      text: InitialStrings.signupText,
                      styleText: TextStyles.buttonApp(ColorManager.white_100),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: ButtonIntroApp(
                        onPressed: () {
                          Navigator.of(context).pushNamed(loginRoute);
                        },
                        styleButton: ButtonStyles.buttonSecondary(),
                        text: InitialStrings.loginText,
                        styleText:
                            TextStyles.buttonApp(ColorManager.purple_200),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
