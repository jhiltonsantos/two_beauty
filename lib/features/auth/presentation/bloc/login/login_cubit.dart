import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/auth/domain/usecases/login/post_login_usecase.dart';
import 'package:two_beauty/features/auth/presentation/bloc/login/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final PostLoginUsecase _postLoginUsecase;
  LoginCubit(this._postLoginUsecase) : super(const InitLoginState());

  Future<void> postLogin() async {
    emit(const LoadingLoginState());
    await _postLoginUsecase
        .execute(NoParams())
        .then((user) => emit(LoadedLoginState(user)));
  }
}
