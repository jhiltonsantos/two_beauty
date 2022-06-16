import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/login/post_login_usecase.dart';

import 'post_login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late PostLoginUsecase usecase;
  late final LoginRepository mockLoginRepository;

  const String refreshData =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1NDkwNzYwMSwiaWF0IjoxNjU0ODIxMjAxLCJqdGkiOiIwZTk4NzY1YjllZDM0OWNiYWNmMGU3MDJhZjE4MzkzOCIsInVzZXJfaWQiOjM1fQ.4w0F9SjudTMICFBUAcUWeZ2vOMg9b_uhuqBSNK4pWpk';
  const String accessData =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0ODI4NDAxLCJpYXQiOjE2NTQ4MjEyMDEsImp0aSI6IjY4MzdmNDI2Mzg0NzQ4ZWJiNGFlYjc1NmZmNDVjNDJkIiwidXNlcl9pZCI6MzV9.a6KLCbV-4YXzJPDe7fx2FCitSZjjbyjw7qFLUdXL8ko';

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = PostLoginUsecase(mockLoginRepository);
  });

  test("Deve retornar o token de acesso do usuário", () async {
    LoginGetTokenEntity tLogin = LoginGetTokenEntity(username: 'maria123', password: "12345");

    when(mockLoginRepository.postLogin(tLogin)).thenAnswer((_) async =>
        const Right(
            UserAccessEntity(refresh: refreshData, access: accessData)));
    final result = await usecase(tLogin);

    expect(
        result,
        const Right(
            UserAccessEntity(refresh: refreshData, access: accessData)));
    verify(mockLoginRepository.postLogin(tLogin));
    verifyNoMoreInteractions(mockLoginRepository);
  });

  test("Deve retornar ServerFailure ao tentar realizar login", () async {
    LoginGetTokenEntity tFailureLogin = LoginGetTokenEntity(username: '123', password: "12");

    when(mockLoginRepository.postLogin(tFailureLogin))
        .thenAnswer((_) async => Left(ServerFailure()));

    final result = await usecase(tFailureLogin);

    expect(result, Left(ServerFailure()));
    verify(mockLoginRepository.postLogin(tFailureLogin));
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
