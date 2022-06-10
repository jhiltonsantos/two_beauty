import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/agenda_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';

@injectable
class PostAgendaDataUsecase extends UseCase<AgendaEntity, AgendaEntity> {
  final AgendaRepository agendaRepository = AgendaRepository();

  @override
  Future<Either<Failure, AgendaEntity>> call(AgendaEntity params) async {
    return agendaRepository.postAgendaData(params);
  }
}
