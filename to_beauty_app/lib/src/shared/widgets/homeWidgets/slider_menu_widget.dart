import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/src/pages/home/home_page.dart';
import 'package:to_beauty_app/src/pages/profile/profile_page.dart';
import 'package:to_beauty_app/src/pages/store/create_store_page.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

class BuildMenu extends StatefulWidget {
  final String username;

  const BuildMenu({Key? key, required this.username}) : super(key: key);

  @override
  State<BuildMenu> createState() => _BuildMenuState();

  //final SharedPreferences sharedPreferences;
}

class _BuildMenuState extends State<BuildMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: false,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: const [
              CircleAvatar(
                backgroundColor: shiniessBrown,
                radius: 50.0,
              ),
              SizedBox(height: 16.0),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              trailing:
                  const Icon(Icons.person, size: 60.0, color: shiniessBrown),
              title: const Text(
                "Perfil",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  color: shiniessBrown,
                  fontWeight: FontWeight.w500,
                ),
              ),
              dense: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListTile(
              title: const Text(
                "Criar negócio",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  color: shiniessBrown,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CreateStorePage(
                    username: widget.username,
                  );
                }));
              },
              trailing:
                  const Icon(Icons.store, size: 60.0, color: shiniessBrown),
              dense: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListTile(
              title: const Text(
                "Sair",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  color: shiniessBrown,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLogged', false);
                prefs.clear();
                prefs.commit();

                Navigator.pushReplacementNamed(context, '/');
              },
              trailing:
                  const Icon(Icons.logout, size: 60.0, color: shiniessBrown),
              dense: false,
            ),
          ),
        ],
      ),
    );
  }
}
