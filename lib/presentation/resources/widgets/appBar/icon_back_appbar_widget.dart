import 'package:flutter/material.dart';
import 'package:two_beauty/presentation/resources/colors_manager.dart';

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
      color: ColorManager.shiniessBrown,
      size: 40,
    );
  }
}
