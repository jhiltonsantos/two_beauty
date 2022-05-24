import 'package:flutter/foundation.dart';

abstract class IntroState {
  const IntroState();

  List<Object> get props => [];
}

@immutable
class InitIntroState extends IntroState {
  const InitIntroState();
}

@immutable
class LoadingIntroState extends IntroState {
  const LoadingIntroState();
}

@immutable
class LoadedIntroState extends IntroState {
  const LoadedIntroState();
}

@immutable
class ErrorIntroState extends IntroState {
  final String message;

  const ErrorIntroState(this.message);

  @override
  List<Object> get props => [message];
}
