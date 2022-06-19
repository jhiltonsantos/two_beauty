import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/response_dialog.dart';

class FailureDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final IconData? icon;
  final Function()? function;

  const FailureDialog({Key? key, this.title, this.message, this.icon, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title ?? '',
      message: message ?? 'Failure function',
      icon: icon ?? Icons.warning,
      colorIcon: ColorManager.purple_300,
      function: function,
    );
  }
}
