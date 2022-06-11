import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String email;
  final String firstName;
  final String password;

  const UserEntity(
      {required this.username,
      required this.email,
      required this.firstName,
      required this.password});

  @override
  List<Object?> get props => [username, email, firstName, password];
}
