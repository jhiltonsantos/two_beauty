import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:to_beauty_app/domain/entities/store_models.dart';
import 'package:to_beauty_app/data/repositories/home_repository.dart';
import 'package:to_beauty_app/data/repositories/store_repository.dart';
import 'package:to_beauty_app/presentation/pages/store_detail/store_detail_page.dart';
import 'package:to_beauty_app/presentation/resources/assets_manager.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/custom_app_bar_widget.dart';
import 'package:to_beauty_app/presentation/resources/widgets/homeWidgets/slider_menu_widget.dart';

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
    return _appBarData(scaffoldKey, _sideMenuKey, _endSideMenuKey);
  }
}

_appBarData(scaffoldKey, _sideMenuKey, _endSideMenuKey) {
  Future<String> user = HomeController.getUserData();
  return FutureBuilder(
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
        Object? users = snapshot.data;
        return _viewAppBar(users, scaffoldKey, _sideMenuKey, _endSideMenuKey);
      });
}

_viewAppBar(users, scaffoldKey, _sideMenuKey, _endSideMenuKey) {
  return SideMenu(
    key: _endSideMenuKey,
    background: ColorManager.shiniessYellow,
    type: SideMenuType.slide,
    menu: const BuildMenu(),
    radius: BorderRadius.circular(5),
    child: SideMenu(
      key: _sideMenuKey,
      menu: const BuildMenu(),
      type: SideMenuType.slide,
      inverse: true,
      background: ColorManager.shiniessYellow,
      radius: BorderRadius.circular(5),
      child: Scaffold(
        appBar: CustomAppBar(
          sideMenuKey: _sideMenuKey,
          endSideMenuKey: _endSideMenuKey,
          name: users,
        ),
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: _body(scaffoldKey, _sideMenuKey, _endSideMenuKey),
      ),
    ),
  );
}

_body(scaffoldKey, _sideMenuKey, _endSideMenuKey) {
  StoreController storeController = StoreController();
  Future<List> store = storeController.getAllData();
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
        GetStore store = stores[index];
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
                                child: Image.asset(
                                  ImageAssets.introImage1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        Text(
                                          store.name,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          maxLines: 1,
                                          style: TextStyles.styleNameStore(),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${store.district}, ${store.city}',
                                      style: TextStyles.stylePlaceStore(),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StoreDetail(
                                            id: store.id,
                                          )));
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
