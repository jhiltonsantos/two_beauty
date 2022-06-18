import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';

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
  final UserGetEntity user;
  final List<StoreGetEntity> stores;
  const LoadedHomeState({required this.user, required this.stores});
}

class CloseAppHomeState extends HomeState {
  const CloseAppHomeState();
}

@immutable
class ErrorHomeState extends HomeState {
  final String message;

  const ErrorHomeState(this.message);

  @override
  List<Object> get props => [message];
}
