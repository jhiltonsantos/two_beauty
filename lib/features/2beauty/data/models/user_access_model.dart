import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';

class UserAccessModel extends UserAccessEntity {
  const UserAccessModel({required String refresh, required String access})
      : super(refresh: refresh, access: access);

  factory UserAccessModel.fromJson(Map<String, dynamic> json) {
    return UserAccessModel(
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
