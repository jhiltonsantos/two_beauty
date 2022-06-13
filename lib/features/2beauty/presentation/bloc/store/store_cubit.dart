import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/store/get_store_data_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@injectable
class StoreCubit extends Cubit<StoreState> {
  final GetStoreDataUsecase _getStoreDataUsecase;

  StoreCubit(this._getStoreDataUsecase) : super(const InitStoreState());

  Future<void> getStoreData(String params) async {
    emit(const LoadingStoreState());
    StoreGetEntity store = await storeGetData(params);
    emit(LoadedStoreState(store: store));
  }

  Future<StoreGetEntity> storeGetData(String params) async {
    late StoreGetEntity store;
    final getDataFromUsecase = await _getStoreDataUsecase.call(params);
    getDataFromUsecase.fold(
        (failure) => emit(const ErrorStoreState(HomeStrings.errorStoresData)),
        (storeData) => store = storeData);
    return store;
  }
}
