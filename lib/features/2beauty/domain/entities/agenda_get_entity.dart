import 'package:equatable/equatable.dart';

class AgendaGetEntity extends Equatable {
  final int id;
  final String date;
  final String initialHour;
  final String finalHour;
  final int agenda;
  final int client;
  final int service;

  const AgendaGetEntity(
      {required this.id,
      required this.date,
      required this.initialHour,
      required this.finalHour,
      required this.agenda,
      required this.client,
      required this.service});

  @override
  List<Object?> get props =>
      [id, date, initialHour, finalHour, agenda, client, service];
}
