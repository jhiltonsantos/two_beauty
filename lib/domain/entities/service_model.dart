class Service {
  int store;
  String name;
  String description;
  double price;
  int countAttendants;
  int durationMinutes;

  Service(
      {required this.store,
      required this.name,
      required this.description,
      required this.price,
      required this.countAttendants,
      required this.durationMinutes});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
        store: json['estabelecimento'],
        name: json['nome'],
        description: json['descricao'],
        price: json['preco'],
        countAttendants: json['qtd_atendentes'],
        durationMinutes: json['duracao']);
  }
}

class GetService {
  int id;
  int store;
  String name;
  String description;
  double price;
  int countAttendants;
  int durationMinutes;

  GetService(
      {required this.id,
      required this.store,
      required this.name,
      required this.description,
      required this.price,
      required this.countAttendants,
      required this.durationMinutes});

  factory GetService.fromJson(Map<String, dynamic> json) {
    return GetService(
        id: json['id'],
        store: json['estabelecimento'],
        name: json['nome'],
        description: json['descricao'],
        price: json['preco'],
        countAttendants: json['qtd_atendentes'],
        durationMinutes: json['duracao']);
  }
}
