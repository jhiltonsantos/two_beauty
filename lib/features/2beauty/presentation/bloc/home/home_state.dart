import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:two_beauty/core/error/failures.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

@immutable
class InitHomeState extends HomeState {
  const InitHomeState();
}

@immutable
class LoadingHomeState extends HomeState {
  const LoadingHomeState();
}

@immutable
class LoadedHomeState extends HomeState {
  final Either<Failure, String> user;
  const LoadedHomeState(this.user);
}

@immutable
class ErrorHomeState extends HomeState {
  final String message;

  const ErrorHomeState(this.message);

  @override
  List<Object> get props => [message];
}
