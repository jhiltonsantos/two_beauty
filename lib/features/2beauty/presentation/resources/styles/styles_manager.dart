import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class TextStyles {
  static TextStyle splashText() {
    return const TextStyle(
        fontFamily: 'Epilogue_500',
        fontSize: 48,
        color: ColorManager.white_100);
  }

  static TextStyle titleApp({double? fontSize}) {
    return TextStyle(
      fontFamily: 'Epilogue_600',
      fontSize: fontSize ?? 28,
      fontWeight: FontWeight.w600,
      color: ColorManager.purple_300,
      overflow: TextOverflow.clip,
    );
  }

  static TextStyle subtitleInitApp(
      {Color? color, String? fontFamily, double? fontSize}) {
    return TextStyle(
      fontFamily: fontFamily ?? 'Epilogue_400',
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w400,
      color: color ?? ColorManager.grey_300,
      overflow: TextOverflow.clip,
    );
  }

  static TextStyle buttonApp(Color colorSelected) {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'Epilogue_600',
      color: colorSelected,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.clip,
    );
  }

  static TextStyle textFormField() {
    return const TextStyle(
      fontSize: 16,
      fontFamily: 'Epilogue_600',
      color: ColorManager.grey_500,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.clip,
    );
  }

  static TextStyle textLabelHome({double? fontSize}) {
    return TextStyle(
      fontFamily: 'Epilogue_600',
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.bold,
      color: ColorManager.grey_600,
      overflow: TextOverflow.clip,
    );
  }
}
