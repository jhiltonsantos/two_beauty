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

  @override
  List<Object?> get props => [store, service, date, timetable];
}
