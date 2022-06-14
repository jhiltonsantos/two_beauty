import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/login/post_login_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/splash/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  // final PostLoginUsecase _postLoginUsecase;

  SplashCubit() : super(const InitSplashState());

  /* Future<void> postLogin(LoginGetTokenEntity params) async {
    emit(const LoadingSplashState());
    await _postLoginUsecase.call(params).then((userReturn) {
      if (userReturn.isRight()) {
        emit(const SentSplashState());
      } else {
        emit(const ErrorSplashState('Nome de usuário ou senha incorreta'));
      }
    });
  } */
}
