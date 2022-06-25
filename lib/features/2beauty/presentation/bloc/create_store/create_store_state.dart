import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CreateStoreState extends Equatable {
  const CreateStoreState();

  @override
  List<Object> get props => [];
}

@immutable
class LoadedCreateStoreState extends CreateStoreState {
  const LoadedCreateStoreState();
}

@immutable
class SentCreateStoreState extends CreateStoreState {
  const SentCreateStoreState();
}

@immutable
class ErrorCreateStoreState extends CreateStoreState {
  final String message;

  const ErrorCreateStoreState(this.message);

  @override
  List<Object> get props => [message];
}
