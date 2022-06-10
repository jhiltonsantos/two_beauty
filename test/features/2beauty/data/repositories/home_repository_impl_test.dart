import 'package:flutter_test/flutter_test.dart';
import 'package:two_beauty/features/2beauty/data/repositories/home_repository_impl.dart';

void main() {
  final repository = HomeRepositoryImpl();

  test("Deve retornar failure ao tentar pegar dados do usuário", () async {
    final dataUser = await repository.getUserData();
    
    expect(dataUser.isLeft(), equals(true));
  });
}
