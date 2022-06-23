import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/appointment_repository.dart';

@injectable
class PostAppointmentDataUsecase extends UseCase<AgendaEntity, AgendaEntity> {
  final AppointmentRepository appointmentRepository;

  PostAppointmentDataUsecase(this.appointmentRepository);

  @override
  Future<Either<Failure, AgendaEntity>> call(AgendaEntity params) async {
    return appointmentRepository.postAppointmentData(params);
  }
}
