import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

@immutable
class LoadingSignupState extends SignupState {
  const LoadingSignupState();
}

@immutable
class LoadedSignupState extends SignupState {
  const LoadedSignupState();
}

@immutable
class SentSignupState extends SignupState {
  const SentSignupState();
}

class ErrorSignupState extends SignupState {
  final String message;

  const ErrorSignupState(this.message);

  @override
  List<Object> get props => [message];
}
