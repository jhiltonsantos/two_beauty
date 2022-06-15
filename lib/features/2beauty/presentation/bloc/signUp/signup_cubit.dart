import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/sign_up/post_new_user_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/signUp/signup_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final PostNewUserUsecase _postNewUserUsecase;

  SignupCubit(this._postNewUserUsecase) : super(const LoadedSignupState());

  Future<void> postNewUser(UserEntity params) async {
    emit(const LoadingSignupState());
    await _postNewUserUsecase.call(params).then((userData) {
      if (userData.isRight()) {
        emit(const SentSignupState());
      } else {
        emit(const ErrorSignupState('Erro ao criar usuário'));
      }
    }).catchError((error) {
      emit(ErrorSignupState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorSignupState(AppStrings.timeException));
    }, test: ((error) => error is SocketException)).catchError((error) {
      emit(ErrorSignupState(error.message));
    });
  }
}
