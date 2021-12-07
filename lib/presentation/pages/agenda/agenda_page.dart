import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:to_beauty_app/domain/service.dart';
import 'package:to_beauty_app/presentation/pages/agenda/agenda_confirmed.dart';
import 'package:to_beauty_app/presentation/pages/agenda/agenda_controller.dart';
import 'package:to_beauty_app/presentation/pages/store_detail/store_detail_page.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/styles_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/appBar/app_bar_create_store.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage(
      {Key? key,
      required this.idStore,
      required this.idService,
      required this.address})
      : super(key: key);
  final int idStore;
  final int idService;
  final String address;

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  int _value = 8;

  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    //Formatando Hora
    String hourFormatted =
        _value < 10 ? "0${_value.toString()}:00" : "${_value.toString()}:00";
    //Formatando Data
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(_selectedValue);
    //Formatando Data por extenso
    final DateFormat formatterExt = DateFormat("dd 'de' MMMM \n'de' yyyy");
    final String dateFormattedExt = formatterExt.format(_selectedValue);

    Future<List> service = AgendaController.getService(widget.idService);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarPersonalize(
                text: AppStrings.appBarAgenda,
                route: StoreDetail(id: widget.idStore),
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

                      return _body(serviceData, _selectedValue, hourFormatted);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: DatePicker(DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: ColorManager.shiniessYellow,
                    selectedTextColor: Colors.white, onDateChange: (date) {
                  setState(() {
                    _selectedValue = date;
                  });
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 20.0, bottom: 5.0),
                      child: Text(
                        "Horários disponíveis",
                        style: styleSubtitleStoreDetailPage(),
                      ),
                    ),
                    for (int i = 8; i <= 19; i++)
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 30, 0),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xFF242424),
                            ),
                          ),
                          ListTile(
                            title: Text('$i:00'),
                            leading: Radio(
                              value: i,
                              groupValue: _value,
                              activeColor: ColorManager.shiniessYellow,
                              onChanged: i == 5
                                  ? null
                                  : (int? value) {
                                      setState(() {
                                        _value = value!;
                                      });
                                    },
                            ),
                          ),
                        ],
                      ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AgendaConfirmed(
                                          storeId: widget.idStore,
                                          serviceId: widget.idService,
                                          date: dateFormatted,
                                          dateExt: dateFormattedExt,
                                          hour: hourFormatted,
                                          address: widget.address,
                                        )));
                          },
                          child: const Text(
                            "Avançar",
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
            ],
          ),
        ),
      ),
    );
  }
}

_body(serviceData, DateTime selectedDate, String hour) {
  GetService service = serviceData[0];
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(35, 30, 35, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                service.name,
                style: styleTitleAgenda(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                service.description,
                style: styleSubtitleStoreDetailPage(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "R\$ ${service.price.toStringAsFixed(2)}",
                style: styleSubtitleStoreDetailPage(),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
