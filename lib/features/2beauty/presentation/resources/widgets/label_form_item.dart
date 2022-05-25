import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class LabelFormItem extends StatelessWidget {
  final String title;
  final double? size;
  final Color? color;

  const LabelFormItem({Key? key, required this.title, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: TextStyle(
          color: color ?? ColorManager.grey_500,
          fontSize: size ?? 16.0,
          fontFamily: 'Epilogue_600',
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
