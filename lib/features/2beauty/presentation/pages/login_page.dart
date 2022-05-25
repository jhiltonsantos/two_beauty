import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white_200,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: AppBarWidget(
            title: LoginStrings.titleLogin,
            leadingIcon: Icons.arrow_back,
          ),
        ),
      ),
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: ((context, state) {
          if (state is LoadingLoginState) {
            return const ProgressWidget();
          }
          if (state is LoadedLoginState) {}
          if (state is SentLoginState) {}
          if (state is ErrorLoginState) {}

          return const Scaffold(
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
          );
        }),
      ),
    );
  }
}
