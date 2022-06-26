// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_owner/create_owner_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_owner/create_owner_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_decoration.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_icons_widget.dart';

class OwnerFormWidget extends StatelessWidget {
  const OwnerFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController ownerCPFInputController =
        TextEditingController();
    final TextEditingController ownerBirthDateInputController =
        TextEditingController();
    final TextEditingController ownerPhoneInputController =
        TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppBarWidget(
                title: 'Tornar proprietário',
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
                    const LabelFormItem(title: 'CPF'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: MaskedTextField(
                        textFieldController: ownerCPFInputController,
                        inputDecoration:
                            DecorationStyle.inputDecorationTextField(
                                "Ex: xxx.xxx.xxx-xx"),
                        autofocus: true,
                        mask: 'xxx.xxx.xxx-xx',
                        maxLength: 14,
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
                        textFieldController: ownerPhoneInputController,
                        inputDecoration:
                            DecorationStyle.inputDecorationTextField(
                                "Ex: (xx) xxxxx-xxxx"),
                        autofocus: true,
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
                    const LabelFormItem(title: 'Data de nascimento'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: MaskedTextField(
                        textFieldController: ownerBirthDateInputController,
                        inputDecoration:
                            DecorationStyle.inputDecorationTextField(
                                "Ex: xx/xx/xxxx"),
                        autofocus: true,
                        mask: 'xx/xx/xxxx',
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        onChange: (String value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: ProgressIconsCreateOwnerWidget(second: true),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ButtonIntroApp(
                  onPressed: () async {
                    final String cpf = ownerCPFInputController.text;
                    final String birthDate = ownerBirthDateInputController.text;
                    final String phone = ownerPhoneInputController.text;

                    if (cpf.isEmpty || birthDate.isEmpty || phone.isEmpty) {
                      BlocProvider.of<CreateOwnerCubit>(context)
                          .emit(const LoadedCreateOwnerState());
                    }

                    String birthDateFormatted =
                        Jiffy(birthDate, "dd/MM/yyyy").format("yyyy-MM-dd");

                    final OwnerEntity createOwner = OwnerEntity(
                        cpf: cpf, phone: phone, birthday: birthDateFormatted);

                    BlocProvider.of<CreateOwnerCubit>(context)
                        .postOwner(createOwner, context);
                  },
                  styleButton: ButtonStyles.buttonPrimary(),
                  styleText: TextStyles.buttonApp(ColorManager.white_100),
                  text: 'Tornar proprietário',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
