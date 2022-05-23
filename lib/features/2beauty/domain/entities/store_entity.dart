class StoreEntity {
  String name;
  String cnpj;
  String city;
  String district;
  String street;
  String number;
  String cep;
  String openHour;
  String closeHour;
  String phone;
  String latitude;
  String longitude;

  StoreEntity({
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
}
