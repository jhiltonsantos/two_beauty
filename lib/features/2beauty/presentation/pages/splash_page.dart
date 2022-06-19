// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/sent_login_user_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/splash_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        if (state is InitSplashState) {
          return const SplashWidget();
        }
        if (state is LoadingSplashState) {
          return const ProgressWidget();
        }
        if (state is NoLoginSplashState) {
          startDelay();
          return const SplashWidget();
        }
        if (state is SentSplashState) {
          return const SentLoginUser();
        }
        if (state is ErrorSplashState) {
          return Scaffold(
              body: FailureDialog(
                message: state.message,
                function: () {
                  BlocProvider.of<SplashCubit>(context)
                      .emit(const LoadingSplashState());
                  Future.delayed(const Duration(seconds: 5))
                      .then((value) => initLogin());
                },
              ));
        }
        return const ErrorPage();
      },
    );
  }

  void initLogin() {
    BlocProvider.of<SplashCubit>(context).getLogin();
  }

  void startDelay() {
    Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(introRoute));
  }
}
