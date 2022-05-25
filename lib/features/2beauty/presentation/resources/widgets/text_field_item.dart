import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class TextFieldItem extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? textInputType;
  const TextFieldItem(
      {Key? key,
      required this.controller,
      this.obscureText,
      this.textInputType,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        obscuringCharacter: "*",
        expands: false,
        controller: controller,
        style: const TextStyle(fontSize: 20.0, fontFamily: "Epilogue_400"),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.white_100,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: ColorManager.white_100, width: 0.0),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.green_100, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          hintText: hintText ?? "",
        ),
      ),
    );
  }
}
