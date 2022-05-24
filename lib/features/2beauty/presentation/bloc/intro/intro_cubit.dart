import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/intro/intro_state.dart';

@injectable
class IntroCubit extends Cubit<IntroState> {
  IntroCubit(IntroState initialState) : super(initialState);
}
