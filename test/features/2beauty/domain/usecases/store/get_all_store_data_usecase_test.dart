import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/store_repository.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/store/get_all_store_data_usecase.dart';

import 'get_store_data_usecase_test.mocks.dart';


void main() {
  late GetAllStoreDataUsecase usecase;
  late final StoreRepository mockStoreRepository;

  setUp(() {
    mockStoreRepository = MockStoreRepository();
    usecase = GetAllStoreDataUsecase(mockStoreRepository);
  });

  const tListStores = <StoreGetEntity>[];

  test("Deve retornar uma lista de estabelecimentos", () async {
    when(mockStoreRepository.getAllStoreData()).thenAnswer((_) async {
     return const Right(tListStores);
    });

    final result = await usecase(NoParams());

    expect(result, const Right(tListStores));
    verify(mockStoreRepository.getAllStoreData());
    verifyNoMoreInteractions(mockStoreRepository);
  });

  test("Deve retornar uma falha ao listar estabelecimentos", () async {
    when(mockStoreRepository.getAllStoreData()).thenAnswer((_) async {
      return Left(ServerFailure());
    });

    final result = await usecase(NoParams());
    expect(result, Left(ServerFailure()));
    verify(mockStoreRepository.getAllStoreData());
    verifyNoMoreInteractions(mockStoreRepository);

  });


}