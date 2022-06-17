import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/sent_login_user_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/splash_widget.dart';
import 'package:two_beauty/objectbox.g.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer timer;
  late Store store;
  late LoginGetTokenEntity loginGetData;

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
        if (state is NoLoginSplashState) {
          startDelay();
          return const SplashWidget();
        }
        if (state is SentSplashState) {
          return const SentLoginUser();
        }
        if (state is ErrorSplashState) {
          return Scaffold(
              backgroundColor: ColorManager.white_200,
              body: FailureDialog(message: state.message));
        }
        return const ErrorPage();
      },
    );
  }

  void initLogin() {
    BlocProvider.of<SplashCubit>(context).getLogin();
  }

  void startDelay() {
    timer = Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(introRoute));
  }
}
