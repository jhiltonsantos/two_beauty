import 'package:flutter/material.dart';

class ButtonIntroApp extends StatelessWidget {
  final ButtonStyle styleButton;
  final TextStyle styleText;
  final String text;
  final Function()? onPressed;

  const ButtonIntroApp({
    Key? key,
    required this.styleButton,
    required this.styleText,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: styleButton,
        child: Text(
          text,
          style: styleText,
        ));
  }
}
