import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class TextLabelProfileWidget extends StatelessWidget {
  final String text;
  final String data;

  const TextLabelProfileWidget({Key? key, required this.text, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelFormItemWidget(title: text, size: 14, color: ColorManager.grey_500),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: LabelFormWidget(
                  title: data, color: ColorManager.grey_300, size: 14.0),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(
            height: 2,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class LabelFormWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double? size;

  const LabelFormWidget(
      {Key? key, required this.title, required this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: size ?? 24.0,
          color: color,
        ),
      ),
    );
  }
}

class LabelFormItemWidget extends StatelessWidget {
  final String title;
  final double? size;
  final Color? color;

  const LabelFormItemWidget({Key? key, required this.title, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Epilogue_400',
          fontWeight: FontWeight.w500,
          color: color ?? Colors.black,
          fontSize: size ?? 24.0,
        ),
      ),
    );
  }
}