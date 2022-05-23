class ServiceGetEntity {
  int id;
  int store;
  String name;
  String description;
  double price;
  int countAttendants;
  int durationMinutes;

  ServiceGetEntity(
      {required this.id,
      required this.store,
      required this.name,
      required this.description,
      required this.price,
      required this.countAttendants,
      required this.durationMinutes});

  factory ServiceGetEntity.fromJson(Map<String, dynamic> json) {
    return ServiceGetEntity(
        id: json['id'],
        store: json['estabelecimento'],
        name: json['nome'],
        description: json['descricao'],
        price: json['preco'],
        countAttendants: json['qtd_atendentes'],
        durationMinutes: json['duracao']);
  }
}
