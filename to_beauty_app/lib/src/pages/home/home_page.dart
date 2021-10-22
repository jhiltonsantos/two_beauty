import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:to_beauty_app/src/models/login_user_models.dart';
import 'package:to_beauty_app/src/models/store_models.dart';
import 'package:to_beauty_app/src/models/user_models.dart';
import 'package:to_beauty_app/src/pages/login/login_controller.dart';
import 'package:to_beauty_app/src/pages/store/store_get_all_controller.dart';
import 'package:to_beauty_app/src/shared/colors.dart';
import 'package:to_beauty_app/src/shared/widgets/appBar/custom_app_bar_widget.dart';
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
    Future<List<UserClass>> user = LoginController.getUser();
    return SideMenu(
      key: _endSideMenuKey,
      background: shiniessYellow,
      type: SideMenuType.slide,
      menu: const BuildMenu(),
      radius: BorderRadius.circular(5),
      child: SideMenu(
        key: _sideMenuKey,
        menu: const BuildMenu(),
        type: SideMenuType.slide,
        inverse: true,
        background: shiniessYellow,
        radius: BorderRadius.circular(5),
        child: Scaffold(
          appBar: CustomAppBar(
            sideMenuKey: _sideMenuKey,
            endSideMenuKey: _endSideMenuKey,
            name: 'hilton',
          ),
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: _body(scaffoldKey, _sideMenuKey, _endSideMenuKey),
        ),
      ),
    );
  }
}

_body(scaffoldKey, _sideMenuKey, _endSideMenuKey) {
  Future<List<Store>> store = StoreGetController.getAllEstabelecimentos();
  return FutureBuilder(
      future: store,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Erro ao acessar os dados");
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        Object? stores = snapshot.data;
        return _listView(stores, scaffoldKey, _sideMenuKey, _endSideMenuKey);
      });
}

_listView(stores, scaffoldKey, _sideMenuKey, _endSideMenuKey) {
  return ListView.builder(
      itemCount: stores != null ? stores.length : 0,
      itemBuilder: (context, index) {
        Store store = stores[index];
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: Color(0xFF242424),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                                  'https://picsum.photos/seed/200/300',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      store.name,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '${store.district}, ${store.city}',
                                      style: const TextStyle(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
/*
const Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Text(
                  'Próximos a você',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            
*/