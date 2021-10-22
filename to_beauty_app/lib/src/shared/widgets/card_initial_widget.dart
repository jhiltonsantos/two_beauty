import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

Card cardLoginCadastro(String text, IconData icon, ontap) {
  return Card(
    elevation: 5.0,
    color: secondaryColor,
    child: InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 120,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 40,
                    color: shiniessBrown,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: shiniessBrown),
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
