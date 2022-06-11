import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';

abstract class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

@immutable
class InitStoreState extends StoreState {
  const InitStoreState();
}

@immutable
class LoadingStoreState extends StoreState {
  const LoadingStoreState();
}

@immutable
class LoadedStoreState extends StoreState {
  final StoreGetEntity store;

  const LoadedStoreState({required this.store});
}

@immutable
class ErrorStoreState extends StoreState {
  final String message;

  const ErrorStoreState(this.message);

  @override
  List<Object> get props => [message];
}
