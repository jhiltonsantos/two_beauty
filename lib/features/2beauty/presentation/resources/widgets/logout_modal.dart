import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/bottom_navy/bottom_navy_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';

@injectable
class LogoutModal {
  call(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        context: context,
        builder: (BuildContext _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Fique mais um pouco.\nDeseja mesmo sair?',
                  style: TextStyles.logoutModal(),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 96.0,
                width: 96.0,
                child: SvgPicture.asset(
                  ImageAssets.imageLogoutModal,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 55.0,
                    width: 155.0,
                    child: ButtonIntroApp(
                      onPressed: () =>
                          BlocProvider.of<BottomNavyCubit>(context).logout(),
                      styleButton: ButtonStyles.buttonPrimary(),
                      styleText: TextStyles.buttonApp(ColorManager.white_100),
                      text: 'Sim',
                    ),
                  ),
                  SizedBox(
                    height: 55.0,
                    width: 155.0,
                    child: ButtonIntroApp(
                      onPressed: () => Navigator.of(context).pop(),
                      styleButton: ButtonStyles.buttonSecondary(),
                      styleText: TextStyles.buttonApp(ColorManager.purple_200),
                      text: 'Não',
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
