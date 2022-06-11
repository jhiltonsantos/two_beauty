import 'package:equatable/equatable.dart';

class UserAccessEntity extends Equatable {
  final String refresh;
  final String access;

  const UserAccessEntity({required this.refresh, required this.access});

  @override
  String toString() {
    return 'loginUser{refresh: $refresh, access: $access}';
  }

  @override
  List<Object?> get props => [refresh, access];
}
