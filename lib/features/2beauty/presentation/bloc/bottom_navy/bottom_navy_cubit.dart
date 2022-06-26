import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/home/logout_user_usecase.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/owner/get_owner_data_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/bottom_navy/bottom_navy_state.dart';

@injectable
class BottomNavyCubit extends Cubit<BottomNavyState> {
  final LogoutUserUsecase _logoutUserUsecase;
  final GetOwnerDataUsecase _getOwnerDataUsecase;

  BottomNavyCubit(this._logoutUserUsecase, this._getOwnerDataUsecase)
      : super(const HomePageLoadedState());

  Future<void> toHomePage() async {
    emit(const HomePageLoadedState());
  }

  Future<void> toCreateStorePage() async {
    emit(const MyStorePageLoadedState());
  }

  Future<void> getOwnerUser() async {
    final getOwner = await _getOwnerDataUsecase.call(NoParams());
    getOwner.fold((failure) {
      if (failure is InternalServerFailure) {
        emit(const CreateOwnerIntroState());
      } else {
        emit(const ErrorPageState('Erro ao buscar proprietário'));
      }
    }, (owner) {
      emit(const MyStorePageLoadedState());
    });
  }

  Future<void> logout() async {
    final logout = await _logoutUserUsecase.call(NoParams());
    logout.fold(
      (failure) => emit(const HomePageLoadedState()),
      (success) => emit(const LogoutPageLoadedState()),
    );
  }
}
