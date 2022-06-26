import 'package:flutter/material.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_create_store_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_icons_widget.dart';

class CreateOwnerIntroPage extends StatelessWidget {
  const CreateOwnerIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: AppBarCreateStoreWidget(
            title: 'Tornar um proprietário',
            subtitle:
                'Precisamos de alguns dados seus antes de cadastrar seu negócio.',
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Center(
                    child: Container(
                      height: 218.0,
                      width: 327.0,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(ImageAssets.introImage9),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
                const ProgressIconsCreateOwnerWidget(first: true),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                  child: ButtonIntroApp(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ownerFormRoute);
                    },
                    styleButton: ButtonStyles.buttonPrimary(),
                    styleText: TextStyles.buttonApp(ColorManager.white_100),
                    text: 'Vamos lá',
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
