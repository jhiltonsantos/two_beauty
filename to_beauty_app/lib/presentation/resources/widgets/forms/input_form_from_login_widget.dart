import 'package:flutter/material.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';

class InputFormFromLogin extends StatelessWidget {
  const InputFormFromLogin(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.typeKeyboard,
      required this.value})
      : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType typeKeyboard;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
      autofocus: false,
      cursorColor: ColorManager.shiniessBrown,
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 4,
            color: ColorManager.shiniessBrown,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.shiniessYellow,
            width: 6,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        hoverColor: ColorManager.shiniessBrown,
      ),
      style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: ColorManager.shiniessBrown,
          fontWeight: FontWeight.w800),
      keyboardType: typeKeyboard,
    );
  }
}
