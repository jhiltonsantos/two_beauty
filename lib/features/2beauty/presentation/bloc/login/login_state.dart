import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

@immutable
class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

@immutable
class LoadedLoginState extends LoginState {
  const LoadedLoginState();
}

@immutable
class SentLoginState extends LoginState {
  const SentLoginState();
}

@immutable
class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState(this.message);

  @override
  List<Object> get props => [message];
}
