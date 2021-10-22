import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

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
      cursorColor: shiniessBrown,
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 4,
            color: shiniessBrown,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: shiniessYellow,
            width: 6,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: backgroudColor,
        hoverColor: shiniessBrown,
      ),
      style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: shiniessBrown,
          fontWeight: FontWeight.w800),
      keyboardType: typeKeyboard,
    );
  }
}
