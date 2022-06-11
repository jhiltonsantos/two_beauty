import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class SubtitleTileCard extends StatelessWidget {
  final String text;
  final String image;

  const SubtitleTileCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 16,
          width: 16,
          child: SvgPicture.asset(
            image,
            color: ColorManager.purple_300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(text),
        ),
      ],
    );
  }
}