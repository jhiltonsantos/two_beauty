import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String cpf;
  final String birthday;
  final String phone;

  const OwnerEntity(
      {required this.cpf, required this.birthday, required this.phone});

  @override
  List<Object?> get props => [cpf, birthday, phone];
}
