import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/home/get_user_data_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetUserDataUsecase _getUserDataUsecase;

  HomeCubit(this._getUserDataUsecase) : super(const InitHomeState());

  Future<void> getUserData(NoParams params) async {
    emit(const LoadingHomeState());
    final either = await _getUserDataUsecase.call(params);
    either.fold(
      (failure) =>
          emit(const ErrorHomeState('Erro ao carregar dados do usuário')),
      (dataUser) => emit(LoadedHomeState(dataUser)),
    );
  }
}
