import 'package:equatable/equatable.dart';

class LoginGetTokenEntity extends Equatable {
  final String username;
  final String password;

  const LoginGetTokenEntity({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
