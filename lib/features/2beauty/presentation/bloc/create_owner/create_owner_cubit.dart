import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/owner/post_new_owner_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_owner/create_owner_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/create_owner_modal.dart';

@injectable
class CreateOwnerCubit extends Cubit<CreateOwnerState> {
  final PostNewOwnerUsecase _postOwner;
  CreateOwnerCubit(this._postOwner) : super(const LoadedCreateOwnerState());

  Future<void> postOwner(OwnerEntity params, BuildContext context) async {
    await _postOwner.call(params).then((owner){
      owner.fold((failure) {
        emit(const ErrorCreateOwnerState("Erro ao tentar criar proprietário."));
      }, (ownerCreated) {
        CreateOwnerModal().call(context);
      });
    });
  }
}