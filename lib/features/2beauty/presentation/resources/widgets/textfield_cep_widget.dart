import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:search_cep/search_cep.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_decoration.dart';

class TextFieldCEPWidget extends StatelessWidget {
  const TextFieldCEPWidget({
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
              final infoCep = await ViaCepSearchCep().searchInfoByCep(
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