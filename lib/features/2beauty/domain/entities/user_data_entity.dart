import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final int id;
  final String username;
  final String email;
  final String firstName;

  const UserDataEntity(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName});

  factory UserDataEntity.fromJson(Map<String, dynamic> json) {
    return UserDataEntity(
        id: json['id'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
        firstName: json['first_name'] as String);
  }

  @override
  List<Object?> get props => [id, username, email, firstName];
}
