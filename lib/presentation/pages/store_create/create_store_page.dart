import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:to_beauty_app/domain/store_models.dart';
import 'package:to_beauty_app/presentation/pages/home/home_page.dart';
import 'package:to_beauty_app/presentation/pages/store_create/store_controller.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_personalize.dart';
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
  late final String _latitudeController;
  late final String _longitudeController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Position currentLocation;

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _latitudeController = currentLocation.latitude.toString();
      _longitudeController = currentLocation.longitude.toString();
    });
  }

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
                text: CreateStoreStrings.appBarCreateStore,
                route: HomePage(),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Text(
                          CreateStoreStrings.initForm,
                          style: TextStyles.initFormCreateStore(),
                        ),
                      ),
                    ),
                    fieldForm(CreateStoreStrings.nameStoreField,
                        _nameController, TextInputType.text),
                    fieldForm(CreateStoreStrings.cnpjStoreField,
                        _cnpjController, TextInputType.number),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          CreateStoreStrings.addressForm,
                          style: TextStyles.addressForm(),
                        ),
                      ),
                    ),
                    fieldForm(CreateStoreStrings.streetStoreField,
                        _streetController, TextInputType.streetAddress),
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
                            children: [
                              Text(CreateStoreStrings.districtStoreField,
                                  style: TextStyles.fieldForm()),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    135, 0, 0, 0),
                                child: Text(CreateStoreStrings.cityStoreField,
                                    style: TextStyles.fieldForm()),
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
                            children: [
                              Text(CreateStoreStrings.numberStoreField,
                                  style: TextStyles.fieldForm()),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    120, 0, 0, 0),
                                child: Text(CreateStoreStrings.cepStoreField,
                                    style: TextStyles.fieldForm()),
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
                                    typeKeyboard: TextInputType.number,
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
                                  typeKeyboard: TextInputType.number,
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
                            children: [
                              Text(CreateStoreStrings.openStoreField,
                                  style: TextStyles.fieldForm()),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    135, 0, 0, 0),
                                child: Text(CreateStoreStrings.closeStoreField,
                                    style: TextStyles.fieldForm()),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        child: Text(
                          CreateStoreStrings.currentLocationButton,
                          style: TextStyles.styleButton(),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 50),
                          primary: ColorManager.secondaryColor,
                          textStyle: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 19,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          getUserLocation();
                        },
                      ),
                    ),
                    fieldForm(CreateStoreStrings.phoneStoreField,
                        _phoneController, TextInputType.phone),
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
                            child: Text(
                              CreateStoreStrings.saveButton,
                              style: TextStyles.styleButton(),
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
                    ),
                    const SizedBox(
                      height: 50,
                    ),
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

Widget fieldForm(String title, TextEditingController textController,
    TextInputType inputType) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      Align(
        alignment: const AlignmentDirectional(-1, 0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Text(
            title,
            style: TextStyles.fieldForm(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: InputFormFromLogin(
          controller: textController,
          obscureText: false,
          typeKeyboard: inputType,
          value: textController.text,
        ),
      ),
    ],
  );
}
