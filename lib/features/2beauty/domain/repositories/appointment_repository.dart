import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

abstract class AppointmentRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, List<AgendaGetEntity>>> getAllAppointmentData();

  Future<Either<Failure, AgendaEntity>> postAppointmentData(AgendaEntity agendaEntity);
}
