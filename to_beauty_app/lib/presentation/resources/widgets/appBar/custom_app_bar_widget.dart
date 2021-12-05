import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.sideMenuKey,
      required this.endSideMenuKey,
      this.height = 200,
      required this.name})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  final GlobalKey<SideMenuState> sideMenuKey;
  final GlobalKey<SideMenuState> endSideMenuKey;
  final double height;
  final String name;

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.75, 0.55),
                    child: Text(
                      'Olá, ${widget.name}',
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      final _state = widget.sideMenuKey.currentState;
                      if (_state!.isOpened) {
                        _state.closeSideMenu();
                      } else {
                        _state.openSideMenu();
                      }
                    },
                    child: const Icon(
                      Icons.menu_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: InkWell(
                    onTap: () {
                      //alertLogin(context, 'Ainda não implementado');
                      Navigator.pushReplacementNamed(context, Routes.mapRoute);
                    },
                    child: Container(
                      width: 340,
                      height: 90,
                      decoration: BoxDecoration(
                        color: ColorManager.shiniessYellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Perto de você',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.75, 0.55),
                          child: Text(
                            'Olá, ${store.name}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            final _state = _sideMenuKey.currentState;
                            if (_state!.isOpened) {
                              _state.closeSideMenu();
                            } else {
                              _state.openSideMenu();
                            }
                          },
                          child: const Icon(
                            Icons.menu_rounded,
                            color: Colors.black,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(36, 0, 36, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: InkWell(
                            onTap: () {
                              scaffoldKey.currentState!
                                  .showSnackBar(const SnackBar(
                                content: Text('Ainda não implementado'),
                                backgroundColor: Colors.red,
                              ));
                            },
                            child: Container(
                              width: 340,
                              height: 90,
                              decoration: BoxDecoration(
                                color: shiniessYellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Perto de você',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
*/