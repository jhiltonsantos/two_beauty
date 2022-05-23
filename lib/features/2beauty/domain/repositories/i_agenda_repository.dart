import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IAgendaRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<AgendaGetEntity>> getAllAgendaData();

  Future<AgendaEntity> postAgendaData(dynamic modelClass);
}
