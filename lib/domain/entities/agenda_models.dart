class Agenda {
  int store;
  int service;
  String date;
  String timetable;

  Agenda(
      {required this.store,
      required this.service,
      required this.date,
      required this.timetable});

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
      store: json['estabelecimento'] ?? 0,
      service: json['servico'],
      date: json['data'],
      timetable: json['horario'],
    );
  }
}

class GetAgenda {
  int id;
  String date;
  String initialHour;
  String finalHour;
  int agenda;
  int client;
  int service;

  GetAgenda(
      {required this.id,
      required this.date,
      required this.initialHour,
      required this.finalHour,
      required this.agenda,
      required this.client,
      required this.service});

  factory GetAgenda.fromJson(Map<String, dynamic> json) {
    return GetAgenda(
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
