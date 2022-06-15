import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/response_dialog.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final IconData icon;

  const SuccessDialog(
    this.message, {
    Key? key,
    this.icon = Icons.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      message: message,
      icon: icon,
      colorIcon: Colors.purple,
    );
  }
}

Future<void> showSuccessfulDialog(BuildContext context, String message) async {
  await showDialog(
      context: context,
      builder: (contextDialog) {
        return SuccessDialog(message);
      });
}

class ShowSuccessfulDialog extends StatelessWidget {
  final String text;

  const ShowSuccessfulDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      message: text,
      icon: Icons.done,
      colorIcon: Colors.purple,
    );
  }
}
