import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/home_repository.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_home_repository.dart';

@injectable
class GetUserDataUsecase extends UseCase<String, NoParams> {
  final IHomeRepository _iHomeRepository = HomeRepository();

  @override
  Future<String> execute(NoParams params) async {
    return await _iHomeRepository.getUserData();
  }
}
