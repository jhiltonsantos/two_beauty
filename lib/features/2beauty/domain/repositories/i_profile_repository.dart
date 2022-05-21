import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IProfileRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<dynamic>> getProfileData(id);

  Future<int> getProfileId();
}
