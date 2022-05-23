import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final int store;
  final String name;
  final String description;
  final double price;
  final int countAttendants;
  final int durationMinutes;

  const ServiceEntity(
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

  @override
  List<Object?> get props =>
      [store, name, description, price, countAttendants, durationMinutes];
}
