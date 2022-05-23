import 'package:equatable/equatable.dart';

class ServiceGetEntity extends Equatable {
  final int id;
  final int store;
  final String name;
  final String description;
  final double price;
  final int countAttendants;
  final int durationMinutes;

  const ServiceGetEntity(
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

  @override
  List<Object?> get props =>
      [id, store, name, description, price, countAttendants, durationMinutes];
}
