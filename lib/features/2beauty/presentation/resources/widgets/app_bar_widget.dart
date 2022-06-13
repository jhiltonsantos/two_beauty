import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final double? fontSizeTitle;
  final Function()? leadingOnTap;
  final IconData? leadingIcon;

  const AppBarWidget({
    Key? key,
    required this.title,
    this.leadingOnTap,
    this.leadingIcon,
    this.fontSizeTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              GestureDetector(
                onTap: leadingOnTap ?? () => Navigator.pop(context),
                child: Icon(leadingIcon, size: 28.0),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    title,
                    style: TextStyles.titleApp(fontSize: fontSizeTitle),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
