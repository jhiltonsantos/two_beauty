import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_beauty_app/data/repositories/agenda_repository.dart';
import 'package:to_beauty_app/data/repositories/profile_repository.dart';
import 'package:to_beauty_app/domain/entities/agenda_models.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';

class ProfileAgendaPage extends StatefulWidget {
  const ProfileAgendaPage({Key? key}) : super(key: key);

  @override
  _ProfileAgendaPageState createState() => _ProfileAgendaPageState();
}

class _ProfileAgendaPageState extends State<ProfileAgendaPage> {
  AgendaRepository agendaController = AgendaRepository();

  @override
  Widget build(BuildContext context) {
    Future<List> agenda = agendaController.getAllData();
    return FutureBuilder(
        future: agenda,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              backgroundColor: ColorManager.whiteColor,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          Object? agendaData = snapshot.data;
          return _viewAppBar(agendaData, context);
        });
  }

  _viewAppBar(agendaData, context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: Center(
          child: _body(agendaData, context),
        ));
  }

  _body(agendaData, context) {
    ProfileRepository profileController = ProfileRepository();
    Future<int> userId = profileController.getUserId();
    return FutureBuilder(
      future: userId,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Erro ao acessar os dados");
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        Object? id = snapshot.data;
        return _listView(agendaData, context, id);
      },
    );
  }

  _listView(agendaData, context, id) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: ListView.builder(
        itemCount: agendaData != null ? agendaData.length : 0,
        itemBuilder: (context, index) {
          GetAgenda agenda = agendaData[index];
          DateTime date = DateTime.parse(agenda.date);
          DateFormat formatterExt = DateFormat("dd 'de' MMMM 'de' yyyy");
          String dateFormattedExt = formatterExt.format(date);

          if (agenda.client == id) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${agenda.service}"),
                        )
                      ],
                    ),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          children: [
                                            Text(
                                              dateFormattedExt,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${agenda.initialHour}, ${agenda.finalHour}',
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF9E9E9E),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
