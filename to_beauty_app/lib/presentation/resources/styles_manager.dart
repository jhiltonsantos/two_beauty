import 'package:flutter/material.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';

TextStyle textAppBar() {
  return const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 26,
    fontWeight: FontWeight.normal,
    color: ColorManager.shiniessBrown,
  );
}

TextStyle textAppName() {
  return const TextStyle(fontSize: 38.0, fontWeight: FontWeight.w400);
}

TextStyle subtitleMainScreen() {
  return const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400);
}

TextStyle textCardLoginRegister() {
  return const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: ColorManager.shiniessBrown);
}

TextStyle textCardMap() {
  return const TextStyle(fontFamily: 'Roboto', fontSize: 24);
}

TextStyle textHelloProfile() {
  return const TextStyle(
      fontFamily: 'Roboto', color: Colors.black, fontSize: 24);
}

TextStyle textButtonLoginSignup() {
  return const TextStyle(
      fontFamily: 'Roboto', color: Colors.black, fontSize: 19.0);
}

TextStyle subtitleTextButton() {
  return const TextStyle(
      fontFamily: 'Roboto', color: Colors.black, fontSize: 14.0);
}

TextStyle subtitleTextButtonAccent() {
  return const TextStyle(
      fontFamily: 'Roboto', color: Colors.blueAccent, fontSize: 14.0);
}
