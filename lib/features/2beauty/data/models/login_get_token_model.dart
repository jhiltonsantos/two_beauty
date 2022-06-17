// ignore_for_file: must_be_immutable

import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';

class LoginGetTokenModel extends LoginGetTokenEntity {
  LoginGetTokenModel({required String username, required String password})
      : super(username: username, password: password);

  factory LoginGetTokenModel.fromJson(Map<String, dynamic> json) {
    return LoginGetTokenModel(
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
}
