import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';

class ErrorCardWidget extends StatelessWidget {
  final String message;
  final Function()? function;

  const ErrorCardWidget({
    Key? key,
    required this.message,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white_200,
      body: FailureDialog(
        message: message,
        function: function ?? () => Navigator.of(context).pop(),
      ),
    );
  }
}
