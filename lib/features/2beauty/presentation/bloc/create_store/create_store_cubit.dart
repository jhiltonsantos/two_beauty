import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_state.dart';

@injectable
class CreateStoreCubit extends Cubit<CreateStoreState> {
  CreateStoreCubit() : super(InitCreateStoreState());
}
