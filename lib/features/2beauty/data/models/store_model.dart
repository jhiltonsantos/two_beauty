import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';

class StoreModel extends StoreEntity {
  const StoreModel(
      {required String name,
      required String city,
      required String cnpj,
      required String district,
      required String street,
      required String number,
      required String cep,
      required String openHour,
      required String closeHour,
      required String phone,
      required String latitude,
      required String longitude})
      : super(
            name: name,
            city: city,
            cnpj: cnpj,
            district: district,
            street: street,
            number: number,
            cep: cep,
            openHour: openHour,
            closeHour: closeHour,
            phone: phone,
            latitude: latitude,
            longitude: longitude);

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      name: json['nome'] as String,
      cnpj: json['cnpj'] as String,
      city: json['cidade'] as String,
      district: json['bairro'] as String,
      street: json['rua'] as String,
      number: json['numero'] as String,
      cep: json['cep'] as String,
      openHour: json['horario_inicio'] as String,
      closeHour: json['horario_final'] as String,
      phone: json['telefone'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }
}
