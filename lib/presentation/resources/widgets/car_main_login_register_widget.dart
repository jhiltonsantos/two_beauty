import 'package:flutter/material.dart';
import 'package:two_beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/presentation/resources/styles_manager.dart';

Card cardLoginRegisterWidget(String text, IconData icon, Function()? onTap) {
  return Card(
    elevation: 3.0,
    color: ColorManager.secondaryColor,
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 120,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 40,
                    color: ColorManager.shiniessBrown,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyles.textCardLoginRegister(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
