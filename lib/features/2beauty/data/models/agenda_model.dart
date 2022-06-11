import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';

class AgendaModel extends AgendaEntity {
  const AgendaModel(
      {required int store,
      required int service,
      required String date,
      required String timetable})
      : super(
          store: store,
          service: service,
          date: date,
          timetable: timetable,
        );

  factory AgendaModel.fromJson(Map<String, dynamic> json) {
    return AgendaModel(
      store: json['estabelecimento'] ?? 0,
      service: json['servico'],
      date: json['data'],
      timetable: json['horario'],
    );
  }
}
