import 'package:flutter/material.dart';
import 'package:to_beauty_app/domain/store_models.dart';
import 'package:to_beauty_app/presentation/pages/home/home_page.dart';
import 'package:to_beauty_app/presentation/pages/store_create/store_controller.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_create_store.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/icon_back_appbar_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/text_appBar_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/forms/input_form_from_login_widget.dart';

class CreateStorePage extends StatefulWidget {
  const CreateStorePage({Key? key}) : super(key: key);

  @override
  _CreateStorePageState createState() => _CreateStorePageState();
}

class _CreateStorePageState extends State<CreateStorePage> {
  final StorePostController storeAPI = StorePostController();
  final _nameController = TextEditingController();
  final _cnpjController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _cepController = TextEditingController();
  final _openHourController = TextEditingController();
  final _closeHourController = TextEditingController();
  final _phoneController = TextEditingController();
  final _latitudeController = "2323";
  final _longitudeController = "2123";

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

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
                text: AppStrings.appBarCreateStore,
                route: HomePage(),
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
                              'Nome do estabelecimento',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: ColorManager.shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                            controller: _nameController,
                            obscureText: false,
                            typeKeyboard: TextInputType.text,
                            value: _nameController.text,
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
                              'CNPJ do estabelecimento',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: ColorManager.shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                            controller: _cnpjController,
                            obscureText: false,
                            typeKeyboard: TextInputType.number,
                            value: _cnpjController.text,
                          ),
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
                            color: ColorManager.shiniessBrown,
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
                                  color: ColorManager.shiniessBrown),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InputFormFromLogin(
                            controller: _streetController,
                            obscureText: false,
                            typeKeyboard: TextInputType.text,
                            value: _nameController.text,
                          ),
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
                                      color: ColorManager.shiniessBrown)),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    135, 0, 0, 0),
                                child: Text('Cidade',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: ColorManager.shiniessBrown)),
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
                                  value: _districtController.text,
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
                                  value: _cityController.text,
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
                                      color: ColorManager.shiniessBrown)),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    120, 0, 0, 0),
                                child: Text('CEP',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: ColorManager.shiniessBrown)),
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
                                    value: _numberController.text,
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
                                  value: _numberController.text,
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
                              Text('Abre',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: ColorManager.shiniessBrown)),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    135, 0, 0, 0),
                                child: Text('Fecha',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: ColorManager.shiniessBrown)),
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
                                  controller: _openHourController,
                                  obscureText: false,
                                  typeKeyboard: TextInputType.datetime,
                                  value: _openHourController.text,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: InputFormFromLogin(
                                  controller: _closeHourController,
                                  obscureText: false,
                                  typeKeyboard: TextInputType.datetime,
                                  value: _closeHourController.text,
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
                                    color: ColorManager.shiniessBrown)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: InputFormFromLogin(
                            controller: _phoneController,
                            obscureText: false,
                            typeKeyboard: TextInputType.text,
                            value: _phoneController.text,
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
                                storeAPI.postStore(Store(
                                  name: _nameController.text,
                                  cnpj: _cnpjController.text,
                                  city: _cityController.text,
                                  district: _districtController.text,
                                  street: _streetController.text,
                                  number: _numberController.text,
                                  cep: _cepController.text,
                                  openHour: _openHourController.text,
                                  closeHour: _closeHourController.text,
                                  phone: _phoneController.text,
                                  latitude: _latitudeController,
                                  longitude: _longitudeController,
                                  //user: _userController
                                ));
                                Future.delayed(const Duration(seconds: 1))
                                    .then((value) {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()))
                                      .then((value) => setState(() {}));
                                });
                              });
                            },
                            child: const Text(
                              'Criar',
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
