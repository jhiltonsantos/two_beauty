import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/home/get_user_data_usecase.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/store/get_all_store_data_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetUserDataUsecase _getUserDataUsecase;
  final GetAllStoreDataUsecase _getAllStoreDataUsecase;

  HomeCubit(this._getUserDataUsecase, this._getAllStoreDataUsecase)
      : super(const InitHomeState());

  Future<void> getHomeData(NoParams params) async {
    emit(const LoadingHomeState());

    late UserGetEntity user;
    final getUserData = await _getUserDataUsecase.call(params);
    getUserData.fold(
      (failure) =>
          emit(const ErrorHomeState('Erro ao carregar dados do usuário')),
      (dataUser) => user = dataUser,
    );

    late List<StoreGetEntity> stores;
    final getStoresData = await _getAllStoreDataUsecase.call(params);
    getStoresData.fold(
        (failure) =>
            emit(const ErrorHomeState('Erro ao carregar dados do usuário')),
        (dataStores) => stores = dataStores);

    emit(LoadedHomeState(user: user, stores: stores));
  }
}
