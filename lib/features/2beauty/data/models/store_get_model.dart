import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';

class StoreGetModel extends StoreGetEntity {
  const StoreGetModel(
      {required int id,
      required String name,
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
            id: id,
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

  factory StoreGetModel.fromJson(Map<String, dynamic> json) {
    return StoreGetModel(
      id: json['id'] as int,
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
      //user: json['user'] as int,
    );
  }
}
