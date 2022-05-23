import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String cpf;
  final String birthday;
  final String phone;

  const OwnerEntity(
      {required this.cpf, required this.birthday, required this.phone});

  factory OwnerEntity.fromJson(Map<String, dynamic> json) {
    return OwnerEntity(
      cpf: json['cpf'] as String,
      birthday: json['data_nascimento'] as String,
      phone: json['telefone'] as String,
    );
  }

  @override
  List<Object?> get props => [cpf, birthday, phone];
}
