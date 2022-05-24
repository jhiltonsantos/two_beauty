import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            CircularProgressIndicator(
              color: ColorManager.purple_300,
            ),
          ],
        ),
      ),
    );
  }
}
