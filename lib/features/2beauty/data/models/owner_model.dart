import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';

class OwnerModel extends OwnerEntity {
  const OwnerModel(
      {required String cpf, required String birthday, required String phone})
      : super(cpf: cpf, birthday: birthday, phone: phone);

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      cpf: json['cpf'] as String,
      birthday: json['data_nascimento'] as String,
      phone: json['telefone'] as String,
    );
  }
}
