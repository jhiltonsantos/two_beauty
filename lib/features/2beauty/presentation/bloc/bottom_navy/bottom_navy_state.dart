import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BottomNavyState extends Equatable {
  const BottomNavyState();

  @override
  List<Object> get props => [];
}

@immutable
class CurrentIndexChangedState extends BottomNavyState {
  final int currentIndex;

  const CurrentIndexChangedState({required this.currentIndex});
}

@immutable
class PageLoadingState extends BottomNavyState {
  const PageLoadingState();
}

@immutable
class HomePageLoadedState extends BottomNavyState {
  const HomePageLoadedState();
}

@immutable
class MyStorePageLoadedState extends BottomNavyState {
  const MyStorePageLoadedState();
}

@immutable
class CreateOwnerIntroState extends BottomNavyState {
  const CreateOwnerIntroState();
}

@immutable
class ErrorPageState extends BottomNavyState {
  final String message;

  const ErrorPageState(this.message);

  @override
  List<Object> get props => [message];
}

@immutable
class LogoutPageLoadedState extends BottomNavyState {
  const LogoutPageLoadedState();
}
