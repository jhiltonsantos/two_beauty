import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

@immutable
class InitSplashState extends SplashState {
  const InitSplashState();
}

@immutable
class LoadingSplashState extends SplashState {
  const LoadingSplashState();
}

@immutable
class LoadedSplashState extends SplashState {
  const LoadedSplashState();
}

@immutable
class SentSplashState extends SplashState {
  const SentSplashState();
}

class ErrorSplashState extends SplashState {
  final String message;

  const ErrorSplashState(this.message);

  @override
  List<Object?> get props => [message];
}
