import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';

class SentLoginUser extends StatefulWidget {
  const SentLoginUser({
    Key? key,
  }) : super(key: key);

  @override
  State<SentLoginUser> createState() => _SentLoginUserState();
}

class _SentLoginUserState extends State<SentLoginUser> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then(
        (_) => Navigator.of(context).pushReplacementNamed(bottomNavyRoute));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: ColorManager.white_200,
        body: Center(
          child: ProgressWidget(),
        ));
  }
}
