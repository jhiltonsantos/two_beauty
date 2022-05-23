import 'package:equatable/equatable.dart';

class StoreEntity extends Equatable {
  final String name;
  final String cnpj;
  final String city;
  final String district;
  final String street;
  final String number;
  final String cep;
  final String openHour;
  final String closeHour;
  final String phone;
  final String latitude;
  final String longitude;

  const StoreEntity({
    required this.name,
    required this.city,
    required this.cnpj,
    required this.district,
    required this.street,
    required this.number,
    required this.cep,
    required this.openHour,
    required this.closeHour,
    required this.phone,
    required this.latitude,
    required this.longitude,
  });

  factory StoreEntity.fromJson(Map<String, dynamic> json) {
    return StoreEntity(
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

  @override
  List<Object?> get props => [
        name,
        cnpj,
        city,
        district,
        street,
        number,
        cep,
        openHour,
        closeHour,
        phone,
        latitude,
        longitude
      ];
}
