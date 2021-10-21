import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: backgroudColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(36, 30, 0, 0),
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: primaryColor,
                    splashColor: primaryColor,
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 35, 0, 0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 26,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(36, 30, 0, 0),
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Material(
                            color: accentColorDuo,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 130,
                              height: 72,
                              decoration: BoxDecoration(
                                color: accentColorDuo,
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Container(
                                width: 42,
                                height: 42,
                                constraints: const BoxConstraints(
                                  maxWidth: 45,
                                  maxHeight: 45,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/google-logo.svg',
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 130,
                              height: 72,
                              decoration: BoxDecoration(
                                color: accentColorDuo,
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Container(
                                width: 42,
                                height: 42,
                                constraints: const BoxConstraints(
                                  maxWidth: 45,
                                  maxHeight: 45,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/facebook-logo.svg',
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(35, 50, 35, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Text(
                                'Email',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 19,
                                    color: accentColorDuo),
                              ),
                            ),
                          ),
                          TextFormField(
                            autofocus: true,
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: secondaryColor,
                            ),
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(35, 20, 35, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Text(
                                'Senha',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: const Color(0xFF9E9E9E),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() => _loadingButton = true);
                              try {
                                await Navigator.pushNamed(context, '/home');
                              } finally {
                                setState(() => _loadingButton = false);
                              }
                            },
                            child: const Text('Log In'),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(260, 50),
                              primary: accentColorUno,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: RichText(
                            text: const TextSpan(
                                text: 'Não possui uma conta? ',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: 14.0),
                                children: [
                                  TextSpan(
                                    text: 'Inscrever-se',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontFamily: 'Roboto',
                                        fontSize: 14.0),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
