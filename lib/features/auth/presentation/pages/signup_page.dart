import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/auth/presentation/bloc/signUp/signup_cubit.dart';
import 'package:two_beauty/features/auth/presentation/bloc/signUp/signup_state.dart';
import 'package:two_beauty/features/auth/presentation/resources/widgets/app_bar_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: AppBarWidget(
            title: SingUpStrings.createAccount,
            leadingIcon: Icons.arrow_back,
          ),
        ),
      ),
      body: BlocBuilder<SignupCubit, SignupState>(
        builder: ((context, state) {
          if (state is InitSignupState || state is LoadingSignupState) {
            return const ProgressWidget();
          }
          if (state is LoadedSignupState) {
            return const Text('Carregado');
          }
          if (state is ErrorSignupState) {
            return const FailureDialog('Error');
          }
          return const Center(
            child: Text(
              'Erro Desconhecido',
              style: TextStyle(fontSize: 42.0),
            ),
          );
        }),
      ),
    );
  }
}
