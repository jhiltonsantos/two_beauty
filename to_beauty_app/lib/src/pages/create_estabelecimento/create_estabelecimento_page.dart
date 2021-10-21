import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/models/establishment_models.dart';
import 'package:to_beauty_app/src/pages/create_estabelecimento/estabelecimento_controller.dart';

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
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                    child: Text(
                      'Cadastre seu negócio',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 26,
                      ),
                    ),
                  )
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Nome do estabelecimento',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: _nameController,
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
                          ),
                        )
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
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: _streetController,
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
                          ),
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
                              Text(
                                'Bairro',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    120, 0, 0, 0),
                                child: Text(
                                  'Cidade',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
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
                                child: TextFormField(
                                  controller: _districtController,
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
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: TextFormField(
                                  controller: _cityController,
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
                              Text(
                                'Número',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    105, 0, 0, 0),
                                child: Text(
                                  'CEP',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
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
                                  child: TextFormField(
                                    controller: _numberController,
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
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: TextFormField(
                                  controller: _cepController,
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
                            child: Text(
                              'Telefone',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: _phoneController,
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
                            child: const Text('Criar'),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(260, 50),
                              primary: Colors.blue,
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
