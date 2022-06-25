import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class DecorationStyle {
  static InputDecoration inputDecorationTextField(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: ColorManager.white_100,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: ColorManager.white_100, width: 0.0),
      ),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: ColorManager.purple_200, width: 2.0)),
      hintText: hintText,
    );
  }
}
