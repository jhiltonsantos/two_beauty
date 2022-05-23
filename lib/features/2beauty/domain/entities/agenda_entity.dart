class AgendaEntity {
  int store;
  int service;
  String date;
  String timetable;

  AgendaEntity(
      {required this.store,
      required this.service,
      required this.date,
      required this.timetable});

  factory AgendaEntity.fromJson(Map<String, dynamic> json) {
    return AgendaEntity(
      store: json['estabelecimento'] ?? 0,
      service: json['servico'],
      date: json['data'],
      timetable: json['horario'],
    );
  }
}
