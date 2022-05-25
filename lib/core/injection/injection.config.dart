// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/2beauty/data/repositories/agenda_repository.dart' as _i3;
import '../../features/2beauty/data/repositories/home_repository.dart' as _i12;
import '../../features/2beauty/data/repositories/login_repository.dart' as _i15;
import '../../features/2beauty/data/repositories/owner_repository.dart' as _i16;
import '../../features/2beauty/data/repositories/profile_repository.dart'
    as _i23;
import '../../features/2beauty/data/repositories/service_repository.dart'
    as _i24;
import '../../features/2beauty/data/repositories/sign_up_repository.dart'
    as _i25;
import '../../features/2beauty/data/repositories/store_repository.dart' as _i27;
import '../../features/2beauty/domain/usecases/agenda/get_all_agenda_data_usecase.dart'
    as _i4;
import '../../features/2beauty/domain/usecases/agenda/post_agenda_data_usecase.dart'
    as _i17;
import '../../features/2beauty/domain/usecases/home/get_user_data_usecase.dart'
    as _i11;
import '../../features/2beauty/domain/usecases/login/post_login_usecase.dart'
    as _i18;
import '../../features/2beauty/domain/usecases/owner/post_new_owner_usecase.dart'
    as _i19;
import '../../features/2beauty/domain/usecases/profile/get_profile_data_usecase.dart'
    as _i7;
import '../../features/2beauty/domain/usecases/profile/get_profile_id_usecase.dart'
    as _i8;
import '../../features/2beauty/domain/usecases/service/get_all_service_data_usecase.dart'
    as _i5;
import '../../features/2beauty/domain/usecases/service/get_service_data_usecase.dart'
    as _i9;
import '../../features/2beauty/domain/usecases/service/post_service_data_usecase.dart'
    as _i21;
import '../../features/2beauty/domain/usecases/sign_up/post_new_user_usecase.dart'
    as _i20;
import '../../features/2beauty/domain/usecases/store/get_all_store_data_usecase.dart'
    as _i6;
import '../../features/2beauty/domain/usecases/store/get_store_data_usecase.dart'
    as _i10;
import '../../features/2beauty/domain/usecases/store/post_store_data_usecase.dart'
    as _i22;
import '../../features/2beauty/presentation/bloc/intro/intro_cubit.dart'
    as _i13;
import '../../features/2beauty/presentation/bloc/intro/intro_state.dart'
    as _i14;
import '../../features/2beauty/presentation/bloc/login/login_cubit.dart'
    as _i28;
import '../../features/2beauty/presentation/bloc/signUp/signup_cubit.dart'
    as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AgendaRepository>(() => _i3.AgendaRepository());
  gh.factory<_i4.GetAllAgendaDataUsecase>(() => _i4.GetAllAgendaDataUsecase());
  gh.factory<_i5.GetAllServiceDataUsecase>(
      () => _i5.GetAllServiceDataUsecase());
  gh.factory<_i6.GetAllStoreDataUsecase>(() => _i6.GetAllStoreDataUsecase());
  gh.factory<_i7.GetProfileDataUsecase>(() => _i7.GetProfileDataUsecase());
  gh.factory<_i8.GetProfileIdUsecase>(() => _i8.GetProfileIdUsecase());
  gh.factory<_i9.GetServiceDataUsecase>(() => _i9.GetServiceDataUsecase());
  gh.factory<_i10.GetStoreDataUsecase>(() => _i10.GetStoreDataUsecase());
  gh.factory<_i11.GetUserDataUsecase>(() => _i11.GetUserDataUsecase());
  gh.factory<_i12.HomeRepository>(() => _i12.HomeRepository());
  gh.factory<_i13.IntroCubit>(() => _i13.IntroCubit(get<_i14.IntroState>()));
  gh.factory<_i15.LoginRepository>(() => _i15.LoginRepository());
  gh.factory<_i16.OwnerRepository>(() => _i16.OwnerRepository());
  gh.factory<_i17.PostAgendaDataUsecase>(() => _i17.PostAgendaDataUsecase());
  gh.factory<_i18.PostLoginUsecase>(() => _i18.PostLoginUsecase());
  gh.factory<_i19.PostNewOwnerUsecase>(() => _i19.PostNewOwnerUsecase());
  gh.factory<_i20.PostNewUserUsecase>(() => _i20.PostNewUserUsecase());
  gh.factory<_i21.PostServiceDataUsecase>(() => _i21.PostServiceDataUsecase());
  gh.factory<_i22.PostStoreDataUsecase>(() => _i22.PostStoreDataUsecase());
  gh.factory<_i23.ProfileRepository>(() => _i23.ProfileRepository());
  gh.factory<_i24.ServiceRepository>(() => _i24.ServiceRepository());
  gh.factory<_i25.SignUpRepository>(() => _i25.SignUpRepository());
  gh.factory<_i26.SignupCubit>(
      () => _i26.SignupCubit(get<_i20.PostNewUserUsecase>()));
  gh.factory<_i27.StoreRepository>(() => _i27.StoreRepository());
  gh.factory<_i28.LoginCubit>(
      () => _i28.LoginCubit(get<_i18.PostLoginUsecase>()));
  return get;
}
