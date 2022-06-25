// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:search_cep/search_cep.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_decoration.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_icons_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';

class CreateStoreAddressPage extends StatefulWidget {
  final List listArgs;

  const CreateStoreAddressPage({
    Key? key,
    required this.listArgs,
  }) : super(key: key);

  @override
  State<CreateStoreAddressPage> createState() => _CreateStoreAddressPageState();
}

class _CreateStoreAddressPageState extends State<CreateStoreAddressPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateStoreCubit, CreateStoreState>(
        builder: (context, state) {
      if (state is LoadedCreateStoreState) {
        return StoreAddressWidget(
            name: widget.listArgs[0],
            cnpj: widget.listArgs[1],
            phone: widget.listArgs[2],
            openHour: widget.listArgs[3],
            closeHour: widget.listArgs[4]);
      }
      return const ErrorPage();
    });
  }
}

class StoreAddressWidget extends StatefulWidget {
  final String name;
  final String cnpj;
  final String phone;
  final String openHour;
  final String closeHour;

  const StoreAddressWidget(
      {Key? key,
      required this.name,
      required this.cnpj,
      required this.phone,
      required this.openHour,
      required this.closeHour})
      : super(key: key);

  @override
  State<StoreAddressWidget> createState() => _StoreAddressWidgetState();
}

class _StoreAddressWidgetState extends State<StoreAddressWidget> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController storeCEPInputController =
        TextEditingController();
    final TextEditingController storeCityInputController =
        TextEditingController();
    TextEditingController storeDistrictInputController =
        TextEditingController();
    final TextEditingController storeStreetInputController =
        TextEditingController();
    final TextEditingController storeNumberInputController =
        TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppBarWidget(
                title: 'Endereço do estabelecimento',
                leadingIcon: Icons.arrow_back,
                leadingOnTap: () => Navigator.pop(context)),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelFormItem(title: 'CEP'),
                    TextFieldCEP(
                        storeCEPInputController: storeCEPInputController,
                        storeDistrictInputController:
                            storeDistrictInputController,
                        storeStreetInputController: storeStreetInputController,
                        storeCityInputController: storeCityInputController),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelFormItem(title: 'Cidade'),
                    TextFieldItem(
                      controller: storeCityInputController,
                      hintText: 'Ex: Teresina',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelFormItem(title: 'Bairro'),
                    TextFieldItem(
                      controller: storeDistrictInputController,
                      hintText: 'Ex: Parque Ideal',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelFormItem(title: 'Rua'),
                    TextFieldItem(
                      controller: storeStreetInputController,
                      hintText: 'Ex: Rua Síria',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelFormItem(title: 'Número'),
                    TextFieldItem(
                      controller: storeNumberInputController,
                      hintText: 'Ex: 1022',
                      textInputType: TextInputType.number,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: ProgressIconsWidget(third: true),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ButtonIntroApp(
                  onPressed: () async {
                    final String cep = storeCEPInputController.text;
                    final String district = storeDistrictInputController.text;
                    final String street = storeStreetInputController.text;
                    final String number = storeNumberInputController.text;
                    final String city = storeCityInputController.text;

                    if (cep.isEmpty ||
                        district.isEmpty ||
                        street.isEmpty ||
                        number.isEmpty) {
                      BlocProvider.of<CreateStoreCubit>(context)
                          .emit(const LoadedCreateStoreState());
                    }

                    final StoreEntity createStore = StoreEntity(
                      name: widget.name,
                      city: city,
                      cnpj: widget.cnpj,
                      district: district,
                      street: street,
                      number: number,
                      cep: cep,
                      openHour: widget.openHour,
                      closeHour: widget.closeHour,
                      phone: widget.phone,
                      latitude: '',
                      longitude: '',
                    );

                    BlocProvider.of<CreateStoreCubit>(context)
                        .postStore(createStore);
                  },
                  styleButton: ButtonStyles.buttonPrimary(),
                  styleText: TextStyles.buttonApp(ColorManager.white_100),
                  text: 'Criar negócio',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldCEP extends StatelessWidget {
  const TextFieldCEP({
    Key? key,
    required this.storeCEPInputController,
    required this.storeDistrictInputController,
    required this.storeStreetInputController,
    required this.storeCityInputController,
  }) : super(key: key);

  final TextEditingController storeCEPInputController;
  final TextEditingController storeDistrictInputController;
  final TextEditingController storeStreetInputController;
  final TextEditingController storeCityInputController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: MaskedTextField(
              textFieldController: storeCEPInputController,
              inputDecoration:
                  DecorationStyle.inputDecorationTextField("Ex: 64077850"),
              autofocus: true,
              mask: 'xxxxxxxx',
              maxLength: 8,
              keyboardType: TextInputType.number,
              onChange: (String value) {},
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(40, 40),
            primary: ColorManager.purple_200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: () async {
            if (storeCEPInputController.text.isNotEmpty) {
              final viaCepSearch = ViaCepSearchCep();
              final infoCep = await viaCepSearch.searchInfoByCep(
                  cep: storeCEPInputController.text);

              infoCep.fold((failure) {}, (local) {
                storeDistrictInputController.text = local.bairro!;
                storeStreetInputController.text = local.logradouro!;
                storeCityInputController.text = local.localidade!;
              });
            }
          },
          child: const Icon(Icons.search),
        ),
      ],
    );
  }
}
