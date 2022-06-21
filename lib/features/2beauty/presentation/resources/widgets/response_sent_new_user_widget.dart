import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';

class ResponseSentNewUser extends StatefulWidget {
  const ResponseSentNewUser({
    Key? key,
  }) : super(key: key);

  @override
  State<ResponseSentNewUser> createState() => _ResponseSentNewUserState();
}

class _ResponseSentNewUserState extends State<ResponseSentNewUser> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then(
        (_) => Navigator.of(context).pushReplacementNamed(bottomNavyRoute));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: ProgressWidget(),
    ));
  }
}
