import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/domain/usecases/store/post_store_data_usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_state.dart';

@injectable
class CreateStoreCubit extends Cubit<CreateStoreState> {
  final PostStoreDataUsecase _postStore;

  CreateStoreCubit(this._postStore) : super(const LoadedCreateStoreState());

  Future<void> postStore(StoreEntity params) async {
    await _postStore.call(params).then((store) {
      store.fold((failure) {
        emit(const ErrorCreateStoreState("Erro ao tentar criar estabelecimento"));
      }, (storeCreate) {
        // TODO: CHAMA MODAL
      });
    });
  }


}
