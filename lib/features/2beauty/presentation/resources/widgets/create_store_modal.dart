import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';

@injectable
class CreateStoreModal {
  call(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        context: context,
        builder: (BuildContext _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 96.0,
                  width: 96.0,
                  child: SvgPicture.asset(
                    ImageAssets.successfulImage,
                  ),
                ),
                Text(
                  'Negócio criado com sucesso',
                  style: TextStyles.successModalTitle(),
                  textAlign: TextAlign.center,

                ),
                Text(
                  'Agradecemos por confiar no 2Beauty. Agora aguarde seus clientes.',
                  style: TextStyles.successModalSubtitle(),
                  textAlign: TextAlign.center,
                ),
                ButtonIntroApp(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(bottomNavyRoute),
                  styleButton: ButtonStyles.buttonSecondary(),
                  styleText: TextStyles.buttonApp(ColorManager.purple_200),
                  text: 'Ver estabelecimentos',
                ),
              ],
            ),
          );
        });
  }
}
