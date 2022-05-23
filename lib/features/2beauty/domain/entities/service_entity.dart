class ServiceEntity {
  int store;
  String name;
  String description;
  double price;
  int countAttendants;
  int durationMinutes;

  ServiceEntity(
      {required this.store,
      required this.name,
      required this.description,
      required this.price,
      required this.countAttendants,
      required this.durationMinutes});

  factory ServiceEntity.fromJson(Map<String, dynamic> json) {
    return ServiceEntity(
        store: json['estabelecimento'],
        name: json['nome'],
        description: json['descricao'],
        price: json['preco'],
        countAttendants: json['qtd_atendentes'],
        durationMinutes: json['duracao']);
  }
}
