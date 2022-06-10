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
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: ((context, state) {
        if (state is LoadingLoginState) {
          return const ProgressWidget();
        }
        if (state is LoadedLoginState) {
          return const LoginForm();
        }
        if (state is SentLoginState) {
          return const SentLoginUser();
        }
        if (state is ErrorLoginState) {
          return FailureDialog(state.message);
        }
        return const ErrorPage();
      }),
    );
  }
}

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
            leadingOnTap: (() =>
                Navigator.of(context).pushReplacementNamed(introRoute)),
            title: LoginStrings.titleLogin,
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
              onPressed: () {
                final String user = userInputController.text;
                final String password = passwordInputController.text;

                if (user.isEmpty || password.isEmpty) {
                  const ErrorLoginState("Faltando dados");
                } else {
                  final LoginGetTokenEntity loginGetTokenEntity =
                      LoginGetTokenEntity(username: user, password: password);
                  BlocProvider.of<LoginCubit>(context)
                      .postLogin(loginGetTokenEntity);
                }
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

class SentLoginUser extends StatelessWidget {
  const SentLoginUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white_200,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: AppBarWidget(
              title: '',
              leadingIcon: Icons.arrow_back,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Usuário logado',
                  style: TextStyles.textFormField(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonIntroApp(
                styleButton: ButtonStyles.buttonPrimary(),
                styleText: TextStyles.buttonApp(ColorManager.white_100),
                text: "Continuar",
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed(homeRoute),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
