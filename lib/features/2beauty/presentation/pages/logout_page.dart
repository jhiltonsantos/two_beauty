import 'dart:io';

import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed(homeRoute);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.white_100,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed(homeRoute),
                    child: const Text('Continuar')),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Sair'),
                  onPressed: () => exit(0), // Exit app code
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
