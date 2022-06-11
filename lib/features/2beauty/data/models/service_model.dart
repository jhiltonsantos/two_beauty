import 'package:two_beauty/features/2beauty/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel(
      {required int store,
      required String name,
      required String description,
      required double price,
      required int countAttendants,
      required int durationMinutes})
      : super(
            store: store,
            name: name,
            description: description,
            price: price,
            countAttendants: countAttendants,
            durationMinutes: durationMinutes);

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
        store: json['estabelecimento'],
        name: json['nome'],
        description: json['descricao'],
        price: json['preco'],
        countAttendants: json['qtd_atendentes'],
        durationMinutes: json['duracao']);
  }
}
