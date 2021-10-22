import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

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
      color: shiniessBrown,
      size: 40,
    );
  }
}
