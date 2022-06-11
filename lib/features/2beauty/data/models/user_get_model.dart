import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';

class UserGetModel extends UserGetEntity {
  UserGetModel({
    int? id,
    String? username,
    String? firstName,
    String? email,
  }) : super(
          id: id,
          username: username,
          firstName: firstName,
          email: email,
        );

  UserGetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['email'] = email;
    return data;
  }
}
