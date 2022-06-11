import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class LabelHomePage extends StatelessWidget {
  final double? fontSize;
  final String text;
  final int? countStores;
  const LabelHomePage({
    Key? key,
    this.fontSize,
    required this.text, this.countStores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyles.textLabelHome(fontSize: fontSize ?? 20)),
        CircleAvatar(
          backgroundColor: ColorManager.purple_100,
          radius: 16,
          child: Center(child: Text('${countStores ?? 0}',
              textAlign: TextAlign.center,
              style: TextStyles.countStoreIconText(fontSize: 14))),),
      ],
    );
  }
}
