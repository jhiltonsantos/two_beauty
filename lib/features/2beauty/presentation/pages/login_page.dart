import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/data/datasources/dao/login_dao.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
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
          return LoginForm();
        }
        if (state is SentLoginState) {
          return const SentLoginUser();
        }
        if (state is ErrorLoginState) {
          return Scaffold(
              backgroundColor: ColorManager.white_200,
              body: FailureDialog(message: state.message));
        }
        return const ErrorPage();
      }),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final LoginDAO loginDAO = LoginDAO();

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
              onPressed: () async {
                final String user = userInputController.text;
                final String password = passwordInputController.text;

                if (user.isEmpty || password.isEmpty) {
                  const ErrorLoginState("Faltando dados");
                } else {
                  final LoginGetTokenEntity loginGetTokenEntity =
                      LoginGetTokenEntity(username: user, password: password);
                  await loginDAO.saveLoginData(loginGetTokenEntity).then((_) =>
                      BlocProvider.of<LoginCubit>(context)
                          .postLogin(loginGetTokenEntity));
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

class SentLoginUser extends StatefulWidget {
  const SentLoginUser({
    Key? key,
  }) : super(key: key);

  @override
  State<SentLoginUser> createState() => _SentLoginUserState();
}

class _SentLoginUserState extends State<SentLoginUser> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((_) => Navigator.of(context).pushReplacementNamed(homeRoute));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: ColorManager.white_200,
        body: Center(
          child: ProgressWidget(),
        ));
  }
}
