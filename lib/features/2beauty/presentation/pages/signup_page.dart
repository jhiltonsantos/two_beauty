// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/response_sent_new_user_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/signup_form_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: ((context, state) {
        if (state is LoadingSignupState) {
          return const ProgressWidget();
        }
        if (state is LoadedSignupState) {
          return SignupForm();
        }
        if (state is ErrorSignupState) {
          return Scaffold(
              backgroundColor: ColorManager.white_200,
              body: FailureDialog(message: state.message));
        }
        if (state is SentSignupState) {
          return const ResponseSentNewUser();
        }
        return const ErrorPage();
      }),
    );
  }
}
