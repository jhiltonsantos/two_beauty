import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/home/logout_user_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/bottom_navy/bottom_navy_state.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_state.dart';

@injectable
class BottomNavyCubit extends Cubit<BottomNavyState> {
  final LogoutUserUsecase _logoutUserUsecase;

  BottomNavyCubit(this._logoutUserUsecase) : super(const HomePageLoadedState());

  Future<void> toHomePage() async {
    emit(const HomePageLoadedState());
  }

  Future<void> toCreateStorePage() async {
    emit(const MyStorePageLoadedState());
  }

  Future<void> logout() async {
    final logout = await _logoutUserUsecase.call(NoParams());
    logout.fold(
      (failure) => emit(const HomePageLoadedState()),
      (success) => emit(const LogoutPageLoadedState()),
    );
  }
}
