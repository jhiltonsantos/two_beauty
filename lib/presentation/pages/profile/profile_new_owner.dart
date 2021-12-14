import 'package:flutter/material.dart';
import 'package:to_beauty_app/data/repositories/owner_repository.dart';
import 'package:to_beauty_app/domain/entities/owner_model.dart';
import 'package:to_beauty_app/data/repositories/profile_repository.dart';
import 'package:to_beauty_app/presentation/pages/profile/profile_page.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_personalize.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/input_form_from_login_widget.dart';

class ProfileNewOwner extends StatefulWidget {
  const ProfileNewOwner({Key? key}) : super(key: key);

  @override
  _ProfileNewOwnerState createState() => _ProfileNewOwnerState();
}

class _ProfileNewOwnerState extends State<ProfileNewOwner> {
  final ProfileController profileController = ProfileController();
  final OwnerController ownerController = OwnerController();
  final _cpfController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _phoneController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarPersonalize(
                text: "Torne-se um proprietário",
                route: ProfilePage(),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Text(
                          'Insira seus dados',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.shiniessBrown),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'CPF',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: ColorManager.shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                            controller: _cpfController,
                            obscureText: false,
                            typeKeyboard: TextInputType.text,
                            value: _cpfController.text,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Data de Nascimento',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: ColorManager.shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                            controller: _birthdayController,
                            obscureText: false,
                            typeKeyboard: TextInputType.text,
                            value: _birthdayController.text,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Telefone',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: ColorManager.shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                            controller: _phoneController,
                            obscureText: false,
                            typeKeyboard: TextInputType.text,
                            value: _phoneController.text,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ElevatedButton(
                        child: const Text(
                          'Confirmar',
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
                        onPressed: () async {
                          setState(() {
                            ownerController.postNewOwner(
                              Owner(
                                  cpf: _cpfController.text,
                                  birthday: _birthdayController.text,
                                  phone: _phoneController.text),
                            );
                            Future.delayed(const Duration(seconds: 1))
                                .then((value) {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfilePage()))
                                  .then((value) => setState(() {}));
                            });
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
