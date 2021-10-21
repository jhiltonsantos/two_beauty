import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:to_beauty_app/src/shared/colors.dart';
import 'package:to_beauty_app/src/shared/widgets/homeWidgets/slider_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _endSideMenuKey,
      inverse: true,
      background: shiniessYellow,
      type: SideMenuType.slide,
      menu: BuildMenu(),
      radius: BorderRadius.circular(5),
      child: SideMenu(
        key: _sideMenuKey,
        menu: BuildMenu(),
        type: SideMenuType.slide,
        inverse: true,
        background: shiniessYellow,
        radius: BorderRadius.circular(5),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: backgroudColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Align(
                            alignment: AlignmentDirectional(-0.75, 0.55),
                            child: Text(
                              'Olá, Hilton',
                              style: TextStyle(
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(36, 0, 36, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 25, 0, 0),
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                            child: Text(
                              'Recentes',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          color: Color(0xFF242424),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/446/600',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Salão da Ana',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'Centro, Teresina',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF9E9E9E),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  scaffoldKey.currentState!
                                      .showSnackBar(const SnackBar(
                                    content: Text('Ainda não implementado'),
                                    backgroundColor: Colors.red,
                                  ));
                                },
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: Color(0xFF242424),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                            child: Text(
                              'Bem avaliados',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          color: Color(0xFF242424),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/446/600',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Relax Barbearia',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'Noivos, Teresina',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF9E9E9E),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  scaffoldKey.currentState!
                                      .showSnackBar(const SnackBar(
                                    content: Text('Ainda não implementado'),
                                    backgroundColor: Colors.red,
                                  ));
                                },
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: Color(0xFF242424),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
