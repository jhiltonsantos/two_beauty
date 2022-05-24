import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class ButtonStyles {
  static ButtonStyle buttonPrimary() {
    return ElevatedButton.styleFrom(
      fixedSize: const Size(327, 52),
      primary: ColorManager.purple_200,
      textStyle: TextStyles.buttonApp(ColorManager.white_100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static ButtonStyle buttonSecondary() {
    return ElevatedButton.styleFrom(
      fixedSize: const Size(327, 52),
      onPrimary: ColorManager.purple_200,
      primary: ColorManager.white_100,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ColorManager.purple_200, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
