import 'package:equatable/equatable.dart';

class UserAccessResponseEntity extends Equatable {
  final String refresh;
  final String access;

  const UserAccessResponseEntity({required this.refresh, required this.access});

  factory UserAccessResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserAccessResponseEntity(
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

  @override
  String toString() {
    return 'loginUser{refresh: $refresh, access: $access}';
  }

  @override
  List<Object?> get props => [refresh, access];
}
