import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class LabelHomePage extends StatelessWidget {
  final double? fontSize;
  final String text;
  const LabelHomePage({
    Key? key,
    this.fontSize,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyles.textLabelHome(fontSize: fontSize ?? 24)),
        const Icon(Icons.abc)
      ],
    );
  }
}
