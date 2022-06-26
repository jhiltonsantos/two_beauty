import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class ProgressIconsWidget extends StatelessWidget {
  final bool? first;
  final bool? second;
  final bool? third;

  const ProgressIconsWidget({
    Key? key,
    this.first = false,
    this.second = false,
    this.third = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor:
              first == true ? ColorManager.purple_200 : ColorManager.purple_100,
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 4,
          backgroundColor: second == true
              ? ColorManager.purple_200
              : ColorManager.purple_100,
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 4,
          backgroundColor:
              third == true ? ColorManager.purple_200 : ColorManager.purple_100,
        ),
      ],
    );
  }
}

class ProgressIconsCreateOwnerWidget extends StatelessWidget {
  final bool? first;
  final bool? second;

  const ProgressIconsCreateOwnerWidget({
    Key? key,
    this.first = false,
    this.second = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor:
              first == true ? ColorManager.purple_200 : ColorManager.purple_100,
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 4,
          backgroundColor: second == true
              ? ColorManager.purple_200
              : ColorManager.purple_100,
        )
      ],
    );
  }
}
