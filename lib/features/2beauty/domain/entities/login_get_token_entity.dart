import 'package:equatable/equatable.dart';

class LoginGetTokenEntity extends Equatable {
  final String username;
  final String password;

  const LoginGetTokenEntity({required this.username, required this.password});

  factory LoginGetTokenEntity.fromJson(Map<String, dynamic> json) {
    return LoginGetTokenEntity(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [username, password];
}