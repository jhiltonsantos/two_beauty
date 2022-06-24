import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_icons_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';

class CreateStoreAddressPage extends StatelessWidget {
  final String name;
  final String cnpj;
  final String phone;
  final String openHour;
  final String closeHour;

  const CreateStoreAddressPage({Key? key,
    required this.name,
    required this.cnpj,
    required this.phone,
    required this.openHour,
    required this.closeHour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController storeCEPInputController =
    TextEditingController();
    final TextEditingController storeDistrictInputController =
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
                leadingOnTap: () => Navigator.pop(context)
            ),
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
                    TextFieldItem(
                      controller: storeCEPInputController,
                      hintText: 'Ex: 64.077-850',
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
                  onPressed: () {
                    Navigator.pop(context);
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
