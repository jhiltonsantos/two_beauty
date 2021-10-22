import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_beauty_app/src/models/user_models.dart';
import 'package:to_beauty_app/src/pages/sign_up/sign_up_controller.dart';
import 'package:to_beauty_app/src/shared/colors.dart';
import 'package:to_beauty_app/src/shared/widgets/appBar/icon_back_appbar_widget.dart';
import 'package:to_beauty_app/src/shared/widgets/appBar/text_appBar_widget.dart';
import 'package:to_beauty_app/src/shared/widgets/forms/account_type_widget.dart';
import 'package:to_beauty_app/src/shared/widgets/forms/input_form_from_login_widget.dart';
import 'package:to_beauty_app/src/shared/widgets/forms/text_form_from_login_widget.dart';
import 'package:to_beauty_app/src/shared/widgets/signup/alert_error_signup_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ApiController api = ApiController();
  final _nameController = TextEditingController();
  final _first_nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      backgroundColor: backgroudColor,
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
                        hoverColor: primaryColor,
                        splashColor: primaryColor,
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
                      child: TextAppBar(text: 'Cadastre-se'),
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
                                      color: shiniessBrown)),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 15, 0, 0),
                              child: AccountTypeButton(
                                  image: SvgPicture.asset(
                                      'assets/images/facebook-logo.svg',
                                      color: shiniessBrown)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 30, 35, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const TextFormFromLogin(text: 'Nome'),
                              InputFormFromLogin(
                                controller: _nameController,
                                obscureText: false,
                                typeKeyboard: TextInputType.text,
                                value: _passwordController.text,
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
                              const TextFormFromLogin(text: 'Email'),
                              InputFormFromLogin(
                                controller: _emailController,
                                obscureText: false,
                                typeKeyboard: TextInputType.emailAddress,
                                value: _passwordController.text,
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
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 30, 0, 0),
                              child: ElevatedButton(
                                onPressed: () async {

                                  var pass = await api.createUser(UserClass(
                                      username: _nameController.text,
                                      email: _emailController.text,
                                      first_name: 'Santos',
                                      password: _passwordController.text));

                                  if (pass == true) {
                                    Navigator.popAndPushNamed(
                                        context, '/');
                                  } else {
                                    alertSignup(context, 'Não foi possível realizar o cadastro. Verifique seus dados.');
                                  }

                                },
                                child: const Text(
                                  'Criar Conta',
                                  style: TextStyle(
                                    color: shiniessBrown,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(260, 50),
                                  primary: secondaryColor,
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
                                  'Já possui uma conta?',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                      fontSize: 14.0),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: const Text(
                                      'Faça login',
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
