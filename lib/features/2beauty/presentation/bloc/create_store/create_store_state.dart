import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CreateStoreState extends Equatable {
  const CreateStoreState();

  @override
  List<Object> get props => [];
}

@immutable
class InitCreateStoreState extends CreateStoreState {}
