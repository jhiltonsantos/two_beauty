import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

alertLogin(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Aviso"),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: const Text("Ok"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      });
}
