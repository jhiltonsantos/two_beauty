import 'package:flutter/material.dart';

class ButtonSelect extends StatelessWidget {
  const ButtonSelect({
    Key? key,
    required this.text,
    required this.styleText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final TextStyle styleText;
  final Icon icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ListTile(
        title: Text(
          text,
          style: styleText,
        ),
        onTap: onTap,
        trailing: icon,
        dense: false,
      ),
    );
  }
}
