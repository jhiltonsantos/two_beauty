import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_beauty_app/domain/entities/login_user_models.dart';
import 'package:to_beauty_app/presentation/pages/initial/initial_page.dart';
import 'package:to_beauty_app/presentation/resources/assets_manager.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_personalize.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/account_type_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/input_form_from_login_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/text_form_from_login_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/login/alert_error_login_widget.dart';

import '../../../data/repositories/login_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = LoginController();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _formKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppBarPersonalize(
                  text: LoginStrings.titleLogin,
                  route: InitialPage(),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.85, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                36, 30, 0, 0),
                            child: Text(
                              LoginStrings.chooseOptionLogin,
                              textAlign: TextAlign.start,
                              style: TextStyles.styleLoginSignUpOptions(),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 15, 0, 0),
                              child: AccountTypeButton(
                                image: SvgPicture.asset(
                                  ImageAssets.logoGoogle,
                                  color: ColorManager.shiniessBrown,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 15, 0, 0),
                              child: AccountTypeButton(
                                image: SvgPicture.asset(
                                  ImageAssets.logoFacebook,
                                  color: ColorManager.shiniessBrown,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 50, 35, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const TextFormFromLogin(
                                  text: LoginStrings.userTextField),
                              InputFormFromLogin(
                                controller: _usernameController,
                                obscureText: false,
                                typeKeyboard: TextInputType.emailAddress,
                                value: _usernameController.text,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                35, 20, 35, 0),
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const TextFormFromLogin(
                                      text: LoginStrings.passwordTextField),
                                  InputFormFromLogin(
                                    controller: _passwordController,
                                    obscureText: true,
                                    typeKeyboard: TextInputType.visiblePassword,
                                    value: _passwordController.text,
                                  )
                                ])),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 30, 0, 0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      const Scaffold(
                                        backgroundColor:
                                            ColorManager.whiteColor,
                                        body: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    });
                                    String login = _usernameController.text;
                                    String password = _passwordController.text;

                                    /* var userLogin =
                                        await LoginController.loginUser(
                                            user: login, password: password); */
                                    var userLogin = await loginController
                                        .postLogin(LoginGetToken(
                                            username: login,
                                            password: password));

                                    if (userLogin == true) {
                                      Navigator.pushNamed(
                                          context, Routes.homeRoute);
                                    } else {
                                      alertLogin(
                                        context,
                                        LoginStrings.failLoginDataUser,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()),
                                      );
                                    }
                                  },
                                  child: Text(
                                    LoginStrings.entryAccount,
                                    style: TextStyles.styleButton(),
                                  ),
                                  style: ButtonStyles.buttonStyleLoginSignUp()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  LoginStrings.dontHaveAccount,
                                  style: TextStyles.subtitleTextButton(),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.registerRoute);
                                    },
                                    child: Text(
                                      LoginStrings.doCreatePage,
                                      style:
                                          TextStyles.subtitleTextButtonAccent(),
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
