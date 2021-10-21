import 'package:flutter/material.dart';

class TextAppBar extends StatelessWidget {
  const TextAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 26,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
