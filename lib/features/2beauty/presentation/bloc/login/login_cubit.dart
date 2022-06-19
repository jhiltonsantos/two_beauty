import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/login/post_login_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final PostLoginUsecase _postLoginUsecase;

  LoginCubit(this._postLoginUsecase) : super(const LoadedLoginState());

  Future<void> postLogin(LoginGetTokenEntity params) async {
    emit(const LoadingLoginState());
    await _postLoginUsecase.call(params).then((userReturn) {
      if (userReturn.isRight()) {
        emit(const SentLoginState());
      } else {
        userReturn.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(const ErrorLoginState('Erro ao conectar ao servidor'));
            }
            if (failure is CacheFailure) {
              emit(const ErrorLoginState('Erro ao conectar ao cache'));
            }
          },
          (loginOk) {
            emit(const SentLoginState());
          },
        );
      }
    });
  }
}
