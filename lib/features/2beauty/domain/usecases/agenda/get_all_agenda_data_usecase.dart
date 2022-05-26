import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/agenda_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';

@injectable
class GetAllAgendaDataUsecase extends UseCase<List<AgendaGetEntity>, NoParams> {
  final AgendaRepository agendaRepository = AgendaRepository();

  @override
  Future<Either<Failure, List<AgendaGetEntity>>> execute(
      NoParams params) async {
    return await agendaRepository.getAllAgendaData();
  }
}
