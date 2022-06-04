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

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [username, email, firstName, password];
}
