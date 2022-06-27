import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_decoration.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/failure_dialog.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_icons_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';

class CreateStoreAboutPage extends StatelessWidget {
  const CreateStoreAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController storeNameInputController =
        TextEditingController();
    final TextEditingController storeCNPJInputController =
        TextEditingController();
    final TextEditingController storePhoneInputController =
        TextEditingController();
    final TextEditingController storeOpenHourInputController =
        TextEditingController();
    final TextEditingController storeCloseHourInputController =
        TextEditingController();

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed(bottomNavyRoute);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(180),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: AppBarWidget(
                title: 'Sobre seu estabelecimento',
                leadingIcon: Icons.arrow_back,
                leadingOnTap: () =>
                    Navigator.of(context).pushReplacementNamed(bottomNavyRoute),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelFormItem(title: 'Nome'),
                      TextFieldItem(
                        autofocus: true,
                        controller: storeNameInputController,
                        hintText: 'Ex: Barbearia Alves',
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
                      const LabelFormItem(title: 'CNPJ'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: MaskedTextField(
                          textFieldController: storeCNPJInputController,
                          inputDecoration:
                              DecorationStyle.inputDecorationTextField(
                                  "Ex: xx.xxx.xxx/xxxx-xx"),
                          mask: 'xx.xxx.xxx/xxxx-xx',
                          maxLength: 18,
                          keyboardType: TextInputType.number,
                          onChange: (String value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelFormItem(title: 'Telefone'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: MaskedTextField(
                          textFieldController: storePhoneInputController,
                          inputDecoration:
                              DecorationStyle.inputDecorationTextField(
                                  "Ex: (xx) xxxxx-xxxx"),
                          mask: '(xx) xxxxx-xxxx',
                          maxLength: 15,
                          keyboardType: TextInputType.number,
                          onChange: (String value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelFormItem(title: 'Horário de abertura'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DateTimePicker(
                          scrollPhysics: const BouncingScrollPhysics(),
                          decoration: DecorationStyle.inputDecorationTextField(
                              "Ex: xx:xx"),
                          dateMask: "xx:xx",
                          cancelText: "Cancelar",
                          type: DateTimePickerType.time,
                          initialValue: "",
                          onChanged: (value) =>
                              storeOpenHourInputController.text = value,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelFormItem(title: 'Horário de encerramento'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DateTimePicker(
                          scrollPhysics: const BouncingScrollPhysics(),
                          decoration: DecorationStyle.inputDecorationTextField(
                              "Ex: xx:xx"),
                          dateMask: "xx:xx",
                          cancelText: "Cancelar",
                          type: DateTimePickerType.time,
                          initialValue: "",
                          onChanged: (value) =>
                              storeCloseHourInputController.text = value,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: ProgressIconsWidget(second: true),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ButtonIntroApp(
                    onPressed: () {
                      final name = storeNameInputController.text;
                      final cnpj = storeCNPJInputController.text;
                      final phone = storePhoneInputController.text;
                      final openHour = storeOpenHourInputController.text;
                      final closeHour = storeCloseHourInputController.text;

                      if (name.isEmpty ||
                          cnpj.isEmpty ||
                          phone.isEmpty ||
                          openHour.isEmpty ||
                          closeHour.isEmpty) {
                        return const Scaffold(
                            backgroundColor: ColorManager.white_200,
                            body: FailureDialog(message: 'Faltando dados'));
                      } else {
                        Navigator.of(context).pushReplacementNamed(
                            registerStoreRoute,
                            arguments: [
                              name,
                              cnpj,
                              phone,
                              openHour,
                              closeHour
                            ]);
                      }
                    },
                    styleButton: ButtonStyles.buttonPrimary(),
                    styleText: TextStyles.buttonApp(ColorManager.white_100),
                    text: 'Quase lá',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
