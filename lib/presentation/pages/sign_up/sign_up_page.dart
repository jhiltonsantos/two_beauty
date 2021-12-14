import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_beauty_app/domain/entities/user_models.dart';
import 'package:to_beauty_app/presentation/pages/initial/initial_page.dart';
import 'package:to_beauty_app/data/repositories/sign_up_repository.dart';
import 'package:to_beauty_app/presentation/resources/assets_manager.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_personalize.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/account_type_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/input_form_from_login_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/text_form_from_login_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/signup/alert_error_signup_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signUpController = SignUpController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                  text: SingUpStrings.titleSingUp,
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
                              SingUpStrings.chooseOptionSignUp,
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
                                      color: ColorManager.shiniessBrown)),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 15, 0, 0),
                              child: AccountTypeButton(
                                  image: SvgPicture.asset(
                                      ImageAssets.logoFacebook,
                                      color: ColorManager.shiniessBrown)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              35, 30, 35, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const TextFormFromLogin(
                                  text: SingUpStrings.userNameTextField),
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
                              const TextFormFromLogin(
                                  text: SingUpStrings.emailTextField),
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
                              const TextFormFromLogin(
                                  text: SingUpStrings.passwordTextField),
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
                                  setState(() {
                                    const Scaffold(
                                      backgroundColor: ColorManager.whiteColor,
                                      body: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  });
                                  var pass = await signUpController.postNewUser(
                                      UserClass(
                                          username: _nameController.text,
                                          email: _emailController.text,
                                          firstName: 'Santos',
                                          password: _passwordController.text));

                                  if (pass == true) {
                                    Navigator.popAndPushNamed(
                                        context, Routes.mainRoute);
                                  } else {
                                    alertSignup(context,
                                        SingUpStrings.failCreateDataUser);
                                  }
                                },
                                child: Text(
                                  SingUpStrings.createAccount,
                                  style: TextStyles.styleButton(),
                                ),
                                style: ButtonStyles.buttonStyleLoginSignUp(),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(SingUpStrings.haveAnAccountSingUp,
                                    style: TextStyles.subtitleTextButton()),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.loginRoute);
                                    },
                                    child: Text(SingUpStrings.doLoginPage,
                                        style: TextStyles
                                            .subtitleTextButtonAccent())),
                              ],
                            ),
                            const SizedBox(height: 50),
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
