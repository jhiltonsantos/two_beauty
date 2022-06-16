// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item_password.dart';
import 'package:two_beauty/objectbox.g.dart';

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
    );
  }
}

class SignupForm extends StatelessWidget {
  SignupForm({
    Key? key,
  }) : super(key: key);

  late Store store;
  late LoginGetTokenEntity loginGetData;

  @override
  Widget build(BuildContext context) {
    final TextEditingController userInputController = TextEditingController();
    final TextEditingController emailInputController = TextEditingController();
    final TextEditingController passwordInputController =
        TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.white_200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBarWidget(
            leadingOnTap: (() =>
                Navigator.of(context).pushReplacementNamed(introRoute)),
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
                  hintText: SignUpStrings.emailInputField,
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
                TextFieldItemPassword(
                  controller: passwordInputController,
                  hintText: SignUpStrings.passwordInputField,
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
              text: SignUpStrings.buttonTextSignUp,
              onPressed: () async {
                final String user = userInputController.text;
                final String email = emailInputController.text;
                final String password = passwordInputController.text;

                if (user.isEmpty || email.isEmpty || password.isEmpty) {
                  const ErrorSignupState("Faltando dados");
                } else {
                  final UserEntity userEntity = UserEntity(
                      username: user,
                      email: email,
                      firstName: user,
                      password: password);
                  await setNewLoginDataOnObjectbox(user, password);
                  BlocProvider.of<SignupCubit>(context).postNewUser(userEntity);
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
                SignUpStrings.haveAnAccountSingUp,
                style: TextStyles.subtitleInitApp(),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(loginRoute);
                  },
                  child: Text(
                    SignUpStrings.doLoginPage,
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

  Future<void> setNewLoginDataOnObjectbox(String user, String password) async {
    await initializedDBData();
    loginGetData = LoginGetTokenEntity(username: user, password: password);
    store.box<LoginGetTokenEntity>().put(loginGetData);
    closeDBData();
  }

  Future<void> initializedDBData() async {
    Directory directory = await getApplicationDocumentsDirectory();
    store = Store(
      getObjectBoxModel(),
      directory: '${directory.path}/objectbox',
    );
  }

  void closeDBData() {
    store.close();
  }
}

class ResponseSentNewUser extends StatefulWidget {
  const ResponseSentNewUser({
    Key? key,
  }) : super(key: key);

  @override
  State<ResponseSentNewUser> createState() => _ResponseSentNewUserState();
}

class _ResponseSentNewUserState extends State<ResponseSentNewUser> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((_) => Navigator.of(context).pushReplacementNamed(homeRoute));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: ProgressWidget(),
    ));
  }
}
