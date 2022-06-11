import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required String username,
      required String email,
      required String firstName,
      required String password})
      : super(
            username: username,
            email: email,
            firstName: firstName,
            password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
}
