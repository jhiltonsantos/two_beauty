import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/response_dialog.dart';

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const FailureDialog(
    this.message, {
    Key? key,
    this.title = 'Failure',
    this.icon = Icons.warning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.red,
    );
  }
}
