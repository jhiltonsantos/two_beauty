import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/presentation/pages/profile/profile_page.dart';
import 'package:to_beauty_app/presentation/pages/store_create/create_store_page.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/homeWidgets/button_select_widget.dart';

class BuildMenu extends StatefulWidget {
  const BuildMenu({Key? key}) : super(key: key);

  @override
  State<BuildMenu> createState() => _BuildMenuState();
}

class _BuildMenuState extends State<BuildMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: false,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonSelect(
            text: HomeStrings.perfilSideMenu,
            styleText: TextStyles.styleSideMenu(),
            icon: const Icon(
              Icons.person,
              size: 60.0,
              color: ColorManager.shiniessBrown,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          ButtonSelect(
            text: HomeStrings.createStoreSideMenu,
            styleText: TextStyles.styleSideMenu(),
            icon: const Icon(Icons.store,
                size: 60.0, color: ColorManager.shiniessBrown),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CreateStorePage();
              }));
            },
          ),
          ButtonSelect(
            text: HomeStrings.logOffStoreSideMenu,
            styleText: TextStyles.styleSideMenu(),
            icon: const Icon(Icons.logout,
                size: 60.0, color: ColorManager.shiniessBrown),
            onTap: () async {
              var prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLogged', false);
              prefs.clear();
              Navigator.pushReplacementNamed(context, Routes.mainRoute);
            },
          ),
        ],
      ),
    );
  }
}
