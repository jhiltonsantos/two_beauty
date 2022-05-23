import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/agenda_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_agenda_repository.dart';

@injectable
class PostAgendaDataUsecase extends UseCase<AgendaEntity, NoParams> {
  final IAgendaRepository _iAgendaRepository = AgendaRepository();

  @override
  Future<AgendaEntity> execute(NoParams params) async {
    return _iAgendaRepository.postAgendaData(params);
  }
}
