import 'package:two_beauty/features/2beauty/domain/entities/service_get_entity.dart';

class ServiceGetModel extends ServiceGetEntity {
  const ServiceGetModel(
      {required int id,
      required int store,
      required String name,
      required String description,
      required double price,
      required int countAttendants,
      required int durationMinutes})
      : super(
            id: id,
            store: store,
            name: name,
            description: description,
            price: price,
            countAttendants: countAttendants,
            durationMinutes: durationMinutes);

  factory ServiceGetModel.fromJson(Map<String, dynamic> json) {
    return ServiceGetModel(
        id: json['id'],
        store: json['estabelecimento'],
        name: json['nome'],
        description: json['descricao'],
        price: json['preco'],
        countAttendants: json['qtd_atendentes'],
        durationMinutes: json['duracao']);
  }
}
