// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LoginGetTokenEntity extends Equatable {
  int id;
  String username;
  String password;

  LoginGetTokenEntity(
      {this.id = 0, required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

