import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/login/post_login_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/login/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final PostLoginUsecase _postLoginUsecase;
  LoginCubit(this._postLoginUsecase) : super(const LoadedLoginState());

  Future<void> postLogin(NoParams params) async {
    emit(const LoadingLoginState());
    await _postLoginUsecase
        .execute(params)
        .then((user) => emit(const SentLoginState()));
  }
}
