import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: const [
              CircleAvatar(
                backgroundColor: blueColor,
                radius: 50.0,
              ),
              SizedBox(height: 16.0),
            ],
          ),
          const SizedBox(
            height: 60.0,
          ),
          ListTile(
            onTap: () {},
            trailing:
                const Icon(Icons.account_circle, size: 60.0, color: blueColor),
            title: const Text(
              "Perfil",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                color: blueColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            dense: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/create_estab');
              },
              trailing: const Icon(Icons.store, size: 60.0, color: blueColor),
              title: const Text(
                "Criar negócio",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  color: blueColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              dense: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              trailing: const Icon(Icons.logout, size: 60.0, color: blueColor),
              title: const Text(
                "Sair",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  color: blueColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              dense: false,
            ),
          ),
        ],
      ),
    );
  }
}
