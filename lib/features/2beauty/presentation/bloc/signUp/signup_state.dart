import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_response_entity.dart';

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
  final Either<Failure, UserAccessResponseEntity> user;

  const SentSignupState({required this.user});
}

class ErrorSignupState extends SignupState {
  final String message;

  const ErrorSignupState(this.message);

  @override
  List<Object> get props => [message];
}
