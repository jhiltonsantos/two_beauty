import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

class AccountTypeButton extends StatelessWidget {
  const AccountTypeButton({
    Key? key,
    required this.image,
  }) : super(key: key);

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 130,
          height: 72,
          decoration: BoxDecoration(
            color: shiniessYellow,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: Container(
            width: 42,
            height: 42,
            constraints: const BoxConstraints(
              maxWidth: 45,
              maxHeight: 45,
            ),
            child: image,
          ),
        ),
      ),
    );
  }
}
