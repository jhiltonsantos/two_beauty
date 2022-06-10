import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/home_repository.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/home/get_user_data_usecase.dart';

import 'get_user_data_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository, LoginRepository])
void main() {
  late GetUserDataUsecase usecase;
  late final HomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetUserDataUsecase(mockHomeRepository);
  });

  final tUser = UserGetEntity(
      id: 35,
      username: "maria123",
      firstName: "Hilton",
      email: "maria123@outlook.com");

  test("Deve retornar uma entidade de usuario", () async {
    when(mockHomeRepository.getUserData()).thenAnswer((_) async {
      return Right(tUser);
    });

    final result = await usecase(NoParams());

    expect(
        result,
        Right(UserGetEntity(
            id: 35,
            username: "maria123",
            firstName: "Hilton",
            email: "maria123@outlook.com")));
    verify(mockHomeRepository.getUserData());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
