import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white_200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: AppBarWidget(
              title: '',
              leadingIcon: Icons.arrow_back,
            ),
          ),
        ),
        body: Center(
          child: Text(
            'Error',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}
