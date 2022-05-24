import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/auth/domain/usecases/sign_up/post_new_user_usecase.dart';
import 'package:two_beauty/features/auth/presentation/bloc/signUp/signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final PostNewUserUsecase _postNewUserUsecase;

  SignupCubit(this._postNewUserUsecase) : super(const InitSignupState());

  Future<void> postNewUser() async {
    emit(const LoadingSignupState());
    await _postNewUserUsecase
        .execute(NoParams())
        .then((user) => emit(LoadedSignupState(user)));
  }
}
