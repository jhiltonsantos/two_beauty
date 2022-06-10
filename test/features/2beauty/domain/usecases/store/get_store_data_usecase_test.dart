import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/store_repository.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/store/get_store_data_usecase.dart';

import 'get_store_data_usecase_test.mocks.dart';

@GenerateMocks([StoreRepository])
void main() {
  late GetStoreDataUsecase usecase;
  late final StoreRepository mockStoreRepository;

  setUp(() {
    mockStoreRepository = MockStoreRepository();
    usecase = GetStoreDataUsecase(mockStoreRepository);
  });

  const tStore = StoreGetEntity(
      id: 1,
      name: "salao da tio",
      city: "teresina",
      cnpj: "232323213",
      district: "marques",
      street: "rua 05",
      number: "3464",
      cep: "63049213",
      openHour: "09:00:00",
      closeHour: "19:00:00",
      phone: "943832341",
      latitude: "-23212",
      longitude: "453");
}
