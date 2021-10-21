import 'package:flutter/material.dart';

class IconBackAppBar extends StatelessWidget {
  const IconBackAppBar({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.black,
      size: 40,
    );
  }
}
