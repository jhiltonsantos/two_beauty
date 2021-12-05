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
      store: json['estabelecimento'],
      service: json['servico'],
      date: json['data'],
      timetable: json['horario'],
    );
  }
}
