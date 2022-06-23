import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

@immutable
class LoadingAppointmentState extends AppointmentState {
  const LoadingAppointmentState();
}

@immutable
class LoadedAppointmentState extends AppointmentState {
  const LoadedAppointmentState();
}

@immutable
class SentAppointmentState extends AppointmentState {
  final AgendaEntity appointmentData;
  const SentAppointmentState(this.appointmentData);
}

@immutable
class ErrorAppointmentState extends AppointmentState {
  final String message;

  const ErrorAppointmentState(this.message);

  @override
  List<Object> get props => [message];
}
