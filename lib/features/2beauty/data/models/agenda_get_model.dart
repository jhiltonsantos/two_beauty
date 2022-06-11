import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';

class AgendaGetModel extends AgendaGetEntity {
  const AgendaGetModel(
      {required int id,
      required String date,
      required String initialHour,
      required String finalHour,
      required int agenda,
      required int client,
      required int service})
      : super(
            id: id,
            date: date,
            initialHour: initialHour,
            finalHour: finalHour,
            agenda: agenda,
            client: client,
            service: service);

  factory AgendaGetModel.fromJson(Map<String, dynamic> json) {
    return AgendaGetModel(
      id: json['id'] as int,
      date: json['data'] as String,
      initialHour: json['horario'] as String,
      finalHour: json['horario_termino'] as String,
      agenda: json['agenda'] as int,
      client: json['cliente'] as int,
      service: json['servico'] as int,
    );
  }
}
