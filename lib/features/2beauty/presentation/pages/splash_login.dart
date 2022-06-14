import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/splash_widget.dart';

class SplashLogin extends StatelessWidget {
  const SplashLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return BlocBuilder<SplashCubit, SplashState>(
        bloc: SplashCubit(),
        builder: ((context, state) {
          if (state is InitSplashState || state is LoadingSplashState) {
            Navigator.of(context).pushNamed(introRoute);
          }
          return const SplashWidget();
        }));
  }
}
