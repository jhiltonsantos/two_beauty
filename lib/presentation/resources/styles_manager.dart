import 'package:flutter/material.dart';

import 'package:to_beauty_app/presentation/resources/colors_manager.dart';

class TextStyles {
  static TextStyle textAppBar() {
    return const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 26,
      fontWeight: FontWeight.normal,
      color: ColorManager.shiniessBrown,
    );
  }

  static TextStyle textAppName() {
    return const TextStyle(fontSize: 38.0, fontWeight: FontWeight.w400);
  }

  static TextStyle subtitleMainScreen() {
    return const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400);
  }

  static TextStyle textCardLoginRegister() {
    return const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: ColorManager.shiniessBrown);
  }

  static TextStyle textCardMap() {
    return const TextStyle(fontFamily: 'Roboto', fontSize: 24);
  }

  static TextStyle textHelloProfile() {
    return const TextStyle(
        fontFamily: 'Roboto', color: Colors.black, fontSize: 24);
  }

  static TextStyle textButtonLoginSignup() {
    return const TextStyle(
        fontFamily: 'Roboto', color: Colors.black, fontSize: 19.0);
  }

  static TextStyle subtitleTextButton() {
    return const TextStyle(
        fontFamily: 'Roboto', color: Colors.black, fontSize: 14.0);
  }

  static TextStyle subtitleTextButtonAccent() {
    return const TextStyle(
        fontFamily: 'Roboto', color: Colors.blueAccent, fontSize: 14.0);
  }

  static TextStyle styleTitleNameUser() {
    return const TextStyle(
        fontFamily: 'Roboto', color: Colors.black, fontSize: 24);
  }

  static TextStyle styleTitleAgenda() {
    return const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w800);
  }

  static TextStyle styleTitleStoreDetailPage() {
    return const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28,
    );
  }

  static TextStyle styleSubtitleStoreDetailPage() {
    return const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 22,
    );
  }

  static TextStyle styleLoginSignUpOptions() {
    return const TextStyle(
      fontFamily: 'Roboto',
      color: ColorManager.shiniessBrown,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleButton() {
    return const TextStyle(
      fontFamily: 'Roboto',
      color: ColorManager.shiniessBrown,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleNameStore() {
    return const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
    );
  }

  static TextStyle stylePlaceStore() {
    return const TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xFF9E9E9E),
    );
  }

  static TextStyle styleSideMenu() {
    return const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 22,
      color: ColorManager.shiniessBrown,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle initFormCreateStore() {
    return const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: ColorManager.shiniessBrown);
  }

  static TextStyle fieldForm() {
    return const TextStyle(
        fontFamily: 'Roboto', color: ColorManager.shiniessBrown);
  }

  static TextStyle addressForm() {
    return const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorManager.shiniessBrown,
    );
  }
}

class ButtonStyles {
  static ButtonStyle buttonStyleLoginSignUp() {
    return ElevatedButton.styleFrom(
      fixedSize: const Size(260, 50),
      primary: ColorManager.secondaryColor,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 19,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
