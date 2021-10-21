import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/models/establishment_models.dart';
import 'package:to_beauty_app/src/pages/create_estabelecimento/estabelecimento_controller.dart';
import 'package:to_beauty_app/src/shared/colors.dart';
import 'package:to_beauty_app/src/shared/widgets/appBar/icon_back_appbar_widget.dart';
import 'package:to_beauty_app/src/shared/widgets/appBar/text_appBar_widget.dart';
import 'package:to_beauty_app/src/shared/widgets/forms/input_form_from_login_widget.dart';

class CreateEstabelecimentoPage extends StatefulWidget {
  const CreateEstabelecimentoPage({Key? key}) : super(key: key);

  @override
  _CreateEstabelecimentoPageState createState() =>
      _CreateEstabelecimentoPageState();
}

class _CreateEstabelecimentoPageState extends State<CreateEstabelecimentoPage> {
  final EstabelecimentoController estabelecimentoAPI =
      EstabelecimentoController();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _cepController = TextEditingController();
  final _phoneController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _userController = 4;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 30, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: const IconBackAppBar(
                        icon: Icons.arrow_back,
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                      child: TextAppBar(text: 'Cadastre seu negócio'))
                ],
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
                          'Começar',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: shiniessBrown),
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
                              'Nome do estabelecimento',
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                              controller: _nameController,
                              obscureText: false,
                              typeKeyboard: TextInputType.text),
                        ),
                      ],
                    ),
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Endereço',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: shiniessBrown,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              'Rua',
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                              controller: _streetController,
                              obscureText: false,
                              typeKeyboard: TextInputType.text),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Bairro',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: shiniessBrown)),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    140, 0, 0, 0),
                                child: Text('Cidade',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: shiniessBrown)),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 0),
                                child: InputFormFromLogin(
                                  controller: _districtController,
                                  obscureText: false,
                                  typeKeyboard: TextInputType.text,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: InputFormFromLogin(
                                  controller: _cityController,
                                  obscureText: false,
                                  typeKeyboard: TextInputType.text,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Número',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: shiniessBrown)),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    105, 0, 0, 0),
                                child: Text('CEP',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: shiniessBrown)),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: InputFormFromLogin(
                                    controller: _numberController,
                                    obscureText: false,
                                    typeKeyboard: TextInputType.text,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: InputFormFromLogin(
                                  controller: _cepController,
                                  obscureText: false,
                                  typeKeyboard: TextInputType.text,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text('Telefone',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: shiniessBrown)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: InputFormFromLogin(
                            controller: _phoneController,
                            obscureText: false,
                            typeKeyboard: TextInputType.text,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                estabelecimentoAPI.postEstabelecimento(
                                    Estabelecimento(
                                        nome: _nameController.text,
                                        cidade: _cityController.text,
                                        bairro: _districtController.text,
                                        rua: _streetController.text,
                                        numero: _numberController.text,
                                        cep: _cepController.text,
                                        telefone: _phoneController.text,
                                        latitude: _latitudeController.text,
                                        longitude: _longitudeController.text,
                                        user: _userController));
                                Navigator.pop(context);
                              });
                            },
                            child: const Text(
                              'Criar',
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
                        )
                      ],
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
