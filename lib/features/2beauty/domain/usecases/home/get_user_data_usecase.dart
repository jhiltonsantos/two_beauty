import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_home_repository.dart';

@injectable
class GetUserDataUsecase extends UseCase<String, NoParams> {
  final IHomeRepository _iHomeRepository;

  GetUserDataUsecase(this._iHomeRepository);

  @override
  Future<Either<Failure, String>> execute(NoParams params) async {
    return await _iHomeRepository.getUserData();
  }
}
