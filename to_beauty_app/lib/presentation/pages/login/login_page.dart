import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_beauty_app/presentation/pages/home/home_page.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/icon_back_appbar_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/text_appBar_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/account_type_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/input_form_from_login_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/text_form_from_login_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/login/alert_error_login_widget.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  String? _validateUser(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return "";
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return "Digite a Senha";
    }
    return "";
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(36, 30, 0, 0),
                      child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: ColorManager.primaryColor,
                        splashColor: ColorManager.primaryColor,
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, '/');
                          });
                        },
                        child: const IconBackAppBar(icon: Icons.arrow_back),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 35, 0, 0),
                      child: TextAppBar(text: 'Log In'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-0.85, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(36, 30, 0, 0),
                            child: Text(
                              'Faça seu login com as seguintes opções:',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: ColorManager.shiniessBrown,
                                fontWeight: FontWeight.bold,
                              ),
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
                                  'assets/images/google-logo.svg',
                                  color: ColorManager.shiniessBrown,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 15, 0, 0),
                              child: AccountTypeButton(
                                image: SvgPicture.asset(
                                  'assets/images/facebook-logo.svg',
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
                              const TextFormFromLogin(text: 'Usuário'),
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
                                  const TextFormFromLogin(text: 'Senha'),
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
                                  String login = _usernameController.text;
                                  String password = _passwordController.text;

                                  print("login: $login senha: $password");

                                  var userLogin =
                                      await LoginController.loginUser(
                                          user: login, password: password);

                                  if (userLogin == true) {
                                    /* CHAMAR GET PARA PEGAR INFORMACOES DO CLIENTE */
                                    Navigator.pushNamed(
                                        context, Routes.homeRoute);
                                  } else {
                                    alertLogin(
                                        context, 'Usuário ou senha incorretos');
                                  }
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: ColorManager.shiniessBrown,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(260, 50),
                                  primary: ColorManager.secondaryColor,
                                  textStyle: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 19,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Não possui uma conta?',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                      fontSize: 14.0),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signup');
                                    },
                                    child: const Text(
                                      'Inscrever-se',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontFamily: 'Roboto',
                                          fontSize: 14.0),
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
