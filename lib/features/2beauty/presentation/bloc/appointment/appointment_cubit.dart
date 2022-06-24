import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/agenda/post_appointment_data_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/appointment/appointment_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/appointment_completed_modal.dart';

@injectable
class AppointmentCubit extends Cubit<AppointmentState> {
  final PostAppointmentDataUsecase _postAppointmentUsecase;

  AppointmentCubit(this._postAppointmentUsecase)
      : super(const LoadedAppointmentState());

  Future<void> postAppointment(
      AgendaEntity params, BuildContext context) async {
    await _postAppointmentUsecase.call(params).then((appointmentReturn) {
      appointmentReturn.fold(
        (failure) =>
            emit(const ErrorAppointmentState('Erro ao tentar agendar')),
        (appointmentOK) {
          AppointmentCompletedModal().call(context);
        },
      );
    });
  }
}
