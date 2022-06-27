import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CreateOwnerState extends Equatable {
  const CreateOwnerState();

  @override
  List<Object> get props => [];
}

@immutable
class LoadedCreateOwnerState extends CreateOwnerState {
  const LoadedCreateOwnerState();
}

@immutable
class SentCreateOwnerState extends CreateOwnerState {
  const SentCreateOwnerState();
}

@immutable
class ErrorCreateOwnerState extends CreateOwnerState {
  final String message;

  const ErrorCreateOwnerState(this.message);

  @override
  List<Object> get props => [message];
}
