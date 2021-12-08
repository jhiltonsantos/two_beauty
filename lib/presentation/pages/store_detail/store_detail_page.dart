import 'package:flutter/material.dart';
import 'package:to_beauty_app/domain/service.dart';
import 'package:to_beauty_app/domain/store_get_models.dart';
import 'package:to_beauty_app/presentation/pages/agenda/agenda_page.dart';
import 'package:to_beauty_app/presentation/pages/home/home_page.dart';
import 'package:to_beauty_app/presentation/pages/store_detail/store_detail_controller.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_personalize.dart';

class StoreDetail extends StatefulWidget {
  const StoreDetail({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _StoreDetailState createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  @override
  Widget build(BuildContext context) {
    Future<List> store = StoreDetailController.getAllData(widget.id);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarPersonalize(
                text: AppStrings.appBarAgenda,
                route: HomePage(),
              ),
              Positioned(
                left: 70,
                child: FutureBuilder(
                    future: store,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Scaffold(
                          backgroundColor: ColorManager.whiteColor,
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      Object? storeData = snapshot.data;
                      return _body(storeData, widget.id);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_body(storeData, id) {
  GetStore store = storeData[0];
  String address = "${store.street}, ${store.number}, ${store.district}";
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            store.name,
            style: TextStyles.styleTitleStoreDetailPage(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(35, 30, 35, 20),
              child: Text(
                AppStrings.titleService,
                style: TextStyles.styleSubtitleStoreDetailPage(),
              ),
            ),
          ],
        ),
        _services(id, address)
      ],
    ),
  );
}

_services(id, address) {
  Future<List> services = StoreDetailController.getAllServices();
  return FutureBuilder(
      future: services,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Nao foi possivel carregar os servicos");
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        Object? servicesData = snapshot.data;
        return _listViewServices(servicesData, id, address);
      });
}

_listViewServices(servicesData, id, address) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: servicesData != null ? servicesData.length : 0,
      itemBuilder: (context, index) {
        GetService service = servicesData[index];
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
          child: servicesData[index].store == id
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: const [
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFF242424),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 20, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          children: [
                                            Text(
                                              service.name,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'R\$ ${service.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF9E9E9E),
                                                fontSize: 16),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AgendaPage(
                                                      idStore: id,
                                                      idService: service.id,
                                                      address: address,
                                                    )));
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
        );
      });
}
