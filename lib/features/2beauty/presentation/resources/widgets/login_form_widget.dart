// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userInputController = TextEditingController();
    TextEditingController passwordInputController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorManager.white_200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBarWidget(
            leadingOnTap: () =>
                Navigator.of(context).pushReplacementNamed(introRoute),
            title: LoginStrings.titleLogin,
            leadingIcon: Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelFormItem(title: SignUpStrings.userNameTextField),
                TextFieldItem(
                  autofocus: true,
                  controller: userInputController,
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
                TextFieldItemPassword(
                  controller: passwordInputController,
                  obscureText: true,
                  iconSufix: true,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: ButtonIntroApp(
              styleButton: ButtonStyles.buttonPrimary(),
              styleText: TextStyles.buttonApp(ColorManager.white_100),
              text: LoginStrings.buttonTextLogin,
              onPressed: () async {
                final String user = userInputController.text;
                final String password = passwordInputController.text;

                if (user.isEmpty || password.isEmpty) {
                  BlocProvider.of<LoginCubit>(context)
                      .emit(const ErrorLoginState("Faltando dados"));
                }
                final LoginGetTokenEntity loginGetTokenEntity =
                    LoginGetTokenEntity(username: user, password: password);

                BlocProvider.of<LoginCubit>(context)
                    .postLogin(loginGetTokenEntity);
              },
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LoginStrings.dontHaveAccount,
                style: TextStyles.subtitleInitApp(),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(signupRoute);
                  },
                  child: Text(
                    LoginStrings.doCreatePage,
                    style: TextStyles.subtitleInitApp(
                        fontFamily: 'Epilogue_500',
                        color: ColorManager.purple_200),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
