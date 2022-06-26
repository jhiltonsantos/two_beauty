import 'package:equatable/equatable.dart';

class OwnerGetEntity extends Equatable {
  final int id;
  final String cpf;
  final String birthDate;
  final String phone;
  final String registrationDate;
  final int user;

  const OwnerGetEntity({
    required this.id,
    required this.cpf,
    required this.birthDate,
    required this.phone,
    required this.registrationDate,
    required this.user,
  });

  @override
  List<Object?> get props =>
      [id, cpf, birthDate, phone, registrationDate, user];
}
