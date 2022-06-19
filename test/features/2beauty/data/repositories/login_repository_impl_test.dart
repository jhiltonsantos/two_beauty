import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beauty/core/platform/network_info.dart';
import 'package:two_beauty/features/2beauty/data/datasources/login_local_datasource.dart';
import 'package:two_beauty/features/2beauty/data/repositories/login_repository_impl.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginLocalDataSource, NetworkInfo])
void main() {
  late LoginRepositoryImpl repository;
  late MockLoginLocalDataSource mockLoginLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  const String refreshData =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1NDkwNzYwMSwiaWF0IjoxNjU0ODIxMjAxLCJqdGkiOiIwZTk4NzY1YjllZDM0OWNiYWNmMGU3MDJhZjE4MzkzOCIsInVzZXJfaWQiOjM1fQ.4w0F9SjudTMICFBUAcUWeZ2vOMg9b_uhuqBSNK4pWpk';
  const String accessData =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0ODI4NDAxLCJpYXQiOjE2NTQ4MjEyMDEsImp0aSI6IjY4MzdmNDI2Mzg0NzQ4ZWJiNGFlYjc1NmZmNDVjNDJkIiwidXNlcl9pZCI6MzV9.a6KLCbV-4YXzJPDe7fx2FCitSZjjbyjw7qFLUdXL8ko';

  setUp(() {
    mockLoginLocalDataSource = MockLoginLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = LoginRepositoryImpl(
        loginLocalData: mockLoginLocalDataSource, networkInfo: mockNetworkInfo);
  });

  group('Pegar o login do usuario', () {
    final LoginGetTokenEntity loginData =
        LoginGetTokenEntity(username: 'Hilton', password: '12345');

    final LoginGetTokenEntity loginDataWrong =
        LoginGetTokenEntity(username: 'Hilton', password: 'asdasdas');

    test('Deve verificar se o aparelho está online, retornando verdadeiro',
        () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      final result = await mockNetworkInfo.isConnected;
      expect(result, true);
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);
    });

    test('Deve verificar se o aparelho está online, retornando falso',
        () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await mockNetworkInfo.isConnected;
      expect(result, false);
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);
    });

    test('Deve verificar se foi realizado o login', () async {
      when(repository.postLogin(loginData)).thenAnswer((_) async => const Right(
          UserAccessEntity(refresh: refreshData, access: accessData)));
    });

    test('Deve adicionar novo login em cache', () async {
      when(mockLoginLocalDataSource.isLoginDataOnDB(loginData))
          .thenAnswer((data) async => true);

      final result = await mockLoginLocalDataSource.isLoginDataOnDB(loginData);
      expect(result, true);
      verify(mockLoginLocalDataSource.isLoginDataOnDB(loginData));
      verifyNoMoreInteractions(mockLoginLocalDataSource);
    });

    test('Deve dar error ao tentar realizar login com dados errados de usuário', () async {
      when(mockLoginLocalDataSource.isLoginDataOnDB(loginDataWrong))
          .thenAnswer((_) async => false);

      final result = await mockLoginLocalDataSource.isLoginDataOnDB(loginDataWrong);
      expect(result, false);
      verify(mockLoginLocalDataSource.isLoginDataOnDB(loginDataWrong));
      verifyNoMoreInteractions(mockLoginLocalDataSource);
    });
  });
}
