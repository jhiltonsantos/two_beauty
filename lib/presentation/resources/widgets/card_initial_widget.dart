import 'package:flutter/material.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';

Card cardLoginCadastro(String text, IconData icon, ontap) {
  return Card(
    elevation: 3.0,
    color: ColorManager.secondaryColor,
    child: InkWell(
      onTap: ontap,
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
