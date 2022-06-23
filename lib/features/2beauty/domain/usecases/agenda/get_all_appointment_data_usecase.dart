import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/appointment_repository.dart';

@injectable
class GetAllAppointmentDataUsecase extends UseCase<List<AgendaGetEntity>, NoParams> {
  final AppointmentRepository appointmentRepository;

  GetAllAppointmentDataUsecase(this.appointmentRepository);

  @override
  Future<Either<Failure, List<AgendaGetEntity>>> call(NoParams params) async {
    return await appointmentRepository.getAllAppointmentData();
  }
}
