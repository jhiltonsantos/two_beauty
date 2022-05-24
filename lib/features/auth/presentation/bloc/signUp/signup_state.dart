import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

@immutable
class InitSignupState extends SignupState {
  const InitSignupState();
}

@immutable
class LoadingSignupState extends SignupState {
  const LoadingSignupState();
}

@immutable
class LoadedSignupState extends SignupState {
  final dynamic user;
  const LoadedSignupState(this.user);

  @override
  List<Object> get props => [user];
}

class ErrorSignupState extends SignupState {
  final String message;

  const ErrorSignupState(this.message);

  @override
  List<Object> get props => [message];
}
