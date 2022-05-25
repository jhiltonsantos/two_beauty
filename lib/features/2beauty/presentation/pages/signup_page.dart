import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: ((context, state) {
        if (state is InitSignupState || state is LoadingSignupState) {
          return const ProgressWidget();
        }
        if (state is LoadedSignupState) {
          return const SignupForm();
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
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController userInputController = TextEditingController();
    final TextEditingController emailInputController = TextEditingController();
    final TextEditingController passwordInputController =
        TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.white_200,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: AppBarWidget(
            title: SignUpStrings.titleSignUp,
            leadingIcon: Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelFormItem(title: SignUpStrings.userNameTextField),
                TextFieldItem(
                  controller: userInputController,
                  hintText: SignUpStrings.userNameInputField,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelFormItem(title: SignUpStrings.emailTextField),
                TextFieldItem(
                  controller: emailInputController,
                  textInputType: TextInputType.emailAddress,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelFormItem(title: SignUpStrings.passwordTextField),
                TextFieldItem(
                  controller: passwordInputController,
                  obscureText: true,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: ButtonIntroApp(
              styleButton: ButtonStyles.buttonPrimary(),
              styleText: TextStyles.buttonApp(ColorManager.white_100),
              text: SignUpStrings.buttonTextSignUp,
              onPressed: () {
                final String user = userInputController.text;
                final String email = emailInputController.text;
                final String password = passwordInputController.text;

                if (user.isEmpty || email.isEmpty || password.isEmpty) {
                  const ErrorSignupState("Faltando dados");
                } else {
                  final dynamic userEntity = UserEntity(
                      username: user,
                      email: email,
                      firstName: 'Hilton',
                      password: password);
                  // TODO: Resolver enviar a entidade user pelo parametro do postNewUser
                  BlocProvider.of<SignupCubit>(context).postNewUser(userEntity);
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
