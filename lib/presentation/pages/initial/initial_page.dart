import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:to_beauty_app/presentation/resources/assets_manager.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/card_initial_widget.dart';

final List<String> imgList = [
  ImageAssets.introImage1,
  ImageAssets.introImage2,
  ImageAssets.introImage3,
  ImageAssets.introImage4,
  ImageAssets.introImage5,
  ImageAssets.introImage6,
  ImageAssets.introImage7,
  ImageAssets.introImage8,
  ImageAssets.introImage9,
  ImageAssets.introImage10,
];

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    filterQuality: FilterQuality.low,
                  ),
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: Text(
                      InitialStrings.nameAppUpper,
                      style: TextStyles.textAppName(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 34),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        InitialStrings.subtitleMainScreen,
                        style: TextStyles.subtitleMainScreen(),
                        textAlign: TextAlign.end,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50, top: 12),
                        child: Divider(
                          height: 5,
                          thickness: 1,
                          indent: 115.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                autoPlayCurve: Curves.decelerate,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cardLoginCadastro(InitialStrings.signupText, Icons.arrow_upward,
                    () {
                  setState(() {
                    Navigator.pushNamed(context, Routes.registerRoute);
                  });
                }),
                cardLoginCadastro(InitialStrings.loginText, Icons.east, () {
                  setState(() {
                    Navigator.pushNamed(context, Routes.loginRoute);
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
