import 'package:two_beauty/features/2beauty/domain/entities/owner_get_entity.dart';

class OwnerGetModel extends OwnerGetEntity {
  const OwnerGetModel(
      {required int id,
      required String cpf,
      required String birthDate,
      required String phone,
      required String registrationDate,
      required int user})
      : super(
            id: id,
            cpf: cpf,
            birthDate: birthDate,
            phone: phone,
            registrationDate: registrationDate,
            user: user);

  factory OwnerGetModel.fromJson(Map<String, dynamic> json) {
    return OwnerGetModel(
      id: json['id'],
      cpf: json['cpf'],
      birthDate: json['data_nascimento'],
      phone: json['telefone'],
      registrationDate: json['data_cadastro'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cpf'] = cpf;
    data['data_nascimento'] = birthDate;
    data['telefone'] = phone;
    data['data_cadastro'] = registrationDate;
    data['user'] = user;
    return data;
  }
}
