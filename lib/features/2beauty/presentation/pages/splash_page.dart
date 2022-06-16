import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
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

class SplashLoginPage extends StatefulWidget {
  const SplashLoginPage({Key? key}) : super(key: key);

  @override
  State<SplashLoginPage> createState() => _SplashLoginPageState();
}

class _SplashLoginPageState extends State<SplashLoginPage> {
  late Timer timer;
  late Store store;
  late LoginGetTokenEntity loginGetData;

  @override
  void initState() {
    super.initState();
    initBD();
  }

  @override
  void dispose() {
    store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        if (state is InitSplashState || state is LoadingSplashState) {
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

  void initBD() {
    getApplicationDocumentsDirectory().then((dir) {
      store = Store(
        getObjectBoxModel(),
        directory: '${dir.path}/objectbox',
      );
      getLoginUserApp();
    });
  }

  void getLoginUserApp() {
    final userBox = store.box<LoginGetTokenEntity>();
    final usersData = userBox.getAll();

    if (usersData.isNotEmpty) {
      loginGetData = LoginGetTokenEntity(
          username: usersData[0].username, password: usersData[0].password);
      BlocProvider.of<SplashCubit>(context).postLogin(loginGetData);
    } else {
      startDelay();
    }
  }

  void startDelay() {
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(introRoute);
    });
  }
}
