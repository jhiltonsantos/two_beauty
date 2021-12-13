import 'package:flutter/material.dart';
import 'package:to_beauty_app/domain/user_models.dart';
import 'package:to_beauty_app/presentation/pages/home/home_page.dart';
import 'package:to_beauty_app/presentation/pages/profile/profile_agenda_page.dart';
import 'package:to_beauty_app/presentation/controllers/profile_controller.dart';
import 'package:to_beauty_app/presentation/pages/profile/profile_new_owner.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_personalize.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Future<List> user = ProfileController.getUserData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarPersonalize(
              text: 'Perfil',
              route: HomePage(),
            ),
            Positioned(
              child: FutureBuilder(
                future: user,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Scaffold(
                      backgroundColor: ColorManager.whiteColor,
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  Object? userData = snapshot.data;
                  UserData user = _userDataRequest(userData);
                  return Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.70, 0.55),
                          child: Text(
                            'Olá, ${user.username}',
                            style: TextStyles.styleTitleStoreDetailPage(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileAgendaPage()));
                            },
                            child: const Text(
                              "Agenda",
                              style: TextStyle(
                                color: ColorManager.shiniessBrown,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(260, 50),
                              primary: ColorManager.secondaryColor,
                              textStyle: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 19,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileNewOwner()));
                            },
                            child: const Text(
                              "Tornar Proprietário",
                              style: TextStyle(
                                color: ColorManager.shiniessBrown,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(260, 50),
                              primary: ColorManager.secondaryColor,
                              textStyle: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 19,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

_userDataRequest(userData) => userData[0];
