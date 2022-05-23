import 'package:equatable/equatable.dart';

class AgendaEntity extends Equatable {
  final int store;
  final int service;
  final String date;
  final String timetable;

  const AgendaEntity(
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

  @override
  List<Object?> get props => [store, service, date, timetable];
}
