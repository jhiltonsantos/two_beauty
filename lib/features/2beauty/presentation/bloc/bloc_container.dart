import 'package:flutter/material.dart';

abstract class BlocContainer extends StatelessWidget {
  const BlocContainer({Key? key}) : super(key: key);

  void pushNavigator(BuildContext blocContext, BlocContainer blocContainer) {
    Navigator.push(
        blocContext, MaterialPageRoute(builder: (_) => blocContainer));
  }
}
