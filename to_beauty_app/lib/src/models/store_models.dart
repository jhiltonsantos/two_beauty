class Store {
  String name;
  String city;
  String district;
  String street;
  String number;
  String cep;
  String phone;
  String latitude;
  String longitude;
  int user;

  Store(
      {required this.name,
      required this.city,
      required this.district,
      required this.street,
      required this.number,
      required this.cep,
      required this.phone,
      required this.latitude,
      required this.longitude,
      required this.user});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['nome'] as String,
      city: json['cidade'] as String,
      district: json['bairro'] as String,
      street: json['rua'] as String,
      number: json['numero'] as String,
      cep: json['cep'] as String,
      phone: json['telefone'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      user: json['user'] as int,
    );
  }
}
