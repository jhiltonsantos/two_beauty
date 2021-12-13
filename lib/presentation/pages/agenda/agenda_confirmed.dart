import 'package:flutter/material.dart';
import 'package:to_beauty_app/domain/agenda_models.dart';
import 'package:to_beauty_app/domain/service_model.dart';
import 'package:to_beauty_app/presentation/controllers/agenda_controller.dart';
import 'package:to_beauty_app/presentation/controllers/service_controller.dart';
import 'package:to_beauty_app/presentation/pages/agenda/agenda_page.dart';
import 'package:to_beauty_app/presentation/pages/store_detail/store_detail_page.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_personalize.dart';

class AgendaConfirmed extends StatefulWidget {
  const AgendaConfirmed({
    Key? key,
    required this.storeId,
    required this.serviceId,
    required this.date,
    required this.dateExt,
    required this.hour,
    required this.address,
  }) : super(key: key);

  final int storeId;
  final int serviceId;
  final String date;
  final String dateExt;
  final String hour;
  final String address;

  @override
  _AgendaConfirmedState createState() => _AgendaConfirmedState();
}

class _AgendaConfirmedState extends State<AgendaConfirmed> {
  final AgendaController agendaController = AgendaController();
  final ServiceController serviceController = ServiceController();

  @override
  Widget build(BuildContext context) {
    Future<List> service = serviceController.getData(widget.serviceId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarPersonalize(
                text: "Resumo",
                route: AgendaPage(
                  idService: widget.serviceId,
                  idStore: widget.storeId,
                  address: widget.address,
                ),
              ),
              Positioned(
                left: 70,
                child: FutureBuilder(
                  future: service,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Scaffold(
                        backgroundColor: ColorManager.whiteColor,
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    Object? serviceData = snapshot.data;
                    return _body(
                        serviceData: serviceData,
                        dateService: widget.date,
                        dateServiceExt: widget.dateExt,
                        hourService: widget.hour,
                        address: widget.address,
                        context: context);
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        agendaController.postData(Agenda(
                            store: widget.storeId,
                            service: widget.serviceId,
                            date: widget.date,
                            timetable: widget.hour));
                      });
                      Future.delayed(const Duration(seconds: 1))
                          .then((value) => {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StoreDetail(
                                                id: widget.storeId)))
                                    .then((value) => setState(() {}))
                              });
                    },
                    child: const Text(
                      "Agendar",
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
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

_body(
    {required serviceData,
    required dateService,
    required dateServiceExt,
    required hourService,
    required address,
    required context}) {
  GetService service = serviceData[0];
  return Padding(
    padding: const EdgeInsets.only(top: 50.0),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            borderOnForeground: true,
            shadowColor: Colors.grey,
            color: ColorManager.silverColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.styleSubtitleStoreDetailPage(),
                          ),
                          Text(
                            "R\$ ${service.price.toStringAsFixed(2)}",
                            style: TextStyles.styleSubtitleStoreDetailPage(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              dateServiceExt,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  children: const <Widget>[
                    Text(
                      'Horário',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 36,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      hourService,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  children: const <Widget>[
                    Text(
                      'Local',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 36,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      address,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
