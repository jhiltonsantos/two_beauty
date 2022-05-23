import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/agenda_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_agenda_repository.dart';

@injectable
class GetAllAgendaDataUsecase extends UseCase<List<AgendaGetEntity>, NoParams> {
  final IAgendaRepository _iAgendaRepository = AgendaRepository();

  @override
  Future<List<AgendaGetEntity>> execute(NoParams params) async {
    return await _iAgendaRepository.getAllAgendaData();
  }
}
