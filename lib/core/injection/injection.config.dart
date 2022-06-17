// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/2beauty/data/datasources/login_local_datasource.dart'
    as _i9;
import '../../features/2beauty/data/datasources/login_local_datasource_impl.dart'
    as _i10;
import '../../features/2beauty/data/repositories/agenda_repository.dart' as _i3;
import '../../features/2beauty/data/repositories/home_repository_impl.dart'
    as _i8;
import '../../features/2beauty/data/repositories/login_repository_impl.dart'
    as _i30;
import '../../features/2beauty/data/repositories/owner_repository.dart' as _i12;
import '../../features/2beauty/data/repositories/profile_repository_imp.dart'
    as _i17;
import '../../features/2beauty/data/repositories/service_repository.dart'
    as _i18;
import '../../features/2beauty/data/repositories/sign_up_repository_impl.dart'
    as _i20;
import '../../features/2beauty/data/repositories/store_repository_impl.dart'
    as _i22;
import '../../features/2beauty/domain/repositories/home_repository.dart' as _i7;
import '../../features/2beauty/domain/repositories/login_repository.dart'
    as _i29;
import '../../features/2beauty/domain/repositories/profile_repository.dart'
    as _i16;
import '../../features/2beauty/domain/repositories/sign_up_repository.dart'
    as _i19;
import '../../features/2beauty/domain/repositories/store_repository.dart'
    as _i21;
import '../../features/2beauty/domain/usecases/agenda/get_all_agenda_data_usecase.dart'
    as _i4;
import '../../features/2beauty/domain/usecases/agenda/post_agenda_data_usecase.dart'
    as _i13;
import '../../features/2beauty/domain/usecases/home/get_user_data_usecase.dart'
    as _i27;
import '../../features/2beauty/domain/usecases/login/post_login_usecase.dart'
    as _i31;
import '../../features/2beauty/domain/usecases/owner/post_new_owner_usecase.dart'
    as _i14;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_id.dart'
    as _i24;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_usecase.dart'
    as _i25;
import '../../features/2beauty/domain/usecases/service/get_all_service_data_usecase.dart'
    as _i5;
import '../../features/2beauty/domain/usecases/service/get_service_data_usecase.dart'
    as _i6;
import '../../features/2beauty/domain/usecases/service/post_service_data_usecase.dart'
    as _i15;
import '../../features/2beauty/domain/usecases/sign_up/post_new_user_usecase.dart'
    as _i32;
import '../../features/2beauty/domain/usecases/store/get_all_store_data_usecase.dart'
    as _i23;
import '../../features/2beauty/domain/usecases/store/get_store_data_usecase.dart'
    as _i26;
import '../../features/2beauty/domain/usecases/store/post_store_data_usecase.dart'
    as _i33;
import '../../features/2beauty/presentation/bloc/home/home_cubit.dart' as _i28;
import '../../features/2beauty/presentation/bloc/login/login_cubit.dart'
    as _i37;
import '../../features/2beauty/presentation/bloc/signUp/signup_cubit.dart'
    as _i34;
import '../../features/2beauty/presentation/bloc/splash/splash_cubit.dart'
    as _i35;
import '../../features/2beauty/presentation/bloc/store/store_cubit.dart'
    as _i36;
import '../platform/network_info.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AgendaRepository>(() => _i3.AgendaRepository());
  gh.factory<_i4.GetAllAgendaDataUsecase>(() => _i4.GetAllAgendaDataUsecase());
  gh.factory<_i5.GetAllServiceDataUsecase>(
      () => _i5.GetAllServiceDataUsecase());
  gh.factory<_i6.GetServiceDataUsecase>(() => _i6.GetServiceDataUsecase());
  gh.factory<_i7.HomeRepository>(() => _i8.HomeRepositoryImpl());
  gh.factory<_i9.LoginLocalDataSource>(() => _i10.LoginLocalDataSourceImpl());
  gh.factory<_i11.NetworkInfo>(() => _i11.NetworkInfoImpl());
  gh.factory<_i12.OwnerRepository>(() => _i12.OwnerRepository());
  gh.factory<_i13.PostAgendaDataUsecase>(() => _i13.PostAgendaDataUsecase());
  gh.factory<_i14.PostNewOwnerUsecase>(() => _i14.PostNewOwnerUsecase());
  gh.factory<_i15.PostServiceDataUsecase>(() => _i15.PostServiceDataUsecase());
  gh.factory<_i16.ProfileRepository>(() => _i17.ProfileRepositoryImp());
  gh.factory<_i18.ServiceRepository>(() => _i18.ServiceRepository());
  gh.factory<_i19.SignUpRepository>(() => _i20.SignUpRepositoryImpl());
  gh.factory<_i21.StoreRepository>(() => _i22.StoreRepositoryImpl());
  gh.factory<_i23.GetAllStoreDataUsecase>(
      () => _i23.GetAllStoreDataUsecase(get<_i21.StoreRepository>()));
  gh.factory<_i24.GetCurrentProfileID>(
      () => _i24.GetCurrentProfileID(get<_i16.ProfileRepository>()));
  gh.factory<_i25.GetCurrentProfileUsecase>(
      () => _i25.GetCurrentProfileUsecase(get<_i16.ProfileRepository>()));
  gh.factory<_i26.GetStoreDataUsecase>(
      () => _i26.GetStoreDataUsecase(get<_i21.StoreRepository>()));
  gh.factory<_i27.GetUserDataUsecase>(
      () => _i27.GetUserDataUsecase(get<_i7.HomeRepository>()));
  gh.factory<_i28.HomeCubit>(() => _i28.HomeCubit(
      get<_i27.GetUserDataUsecase>(), get<_i23.GetAllStoreDataUsecase>()));
  gh.factory<_i29.LoginRepository>(() => _i30.LoginRepositoryImpl(
      loginLocalData: get<_i9.LoginLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.factory<_i31.PostLoginUsecase>(
      () => _i31.PostLoginUsecase(get<_i29.LoginRepository>()));
  gh.factory<_i32.PostNewUserUsecase>(
      () => _i32.PostNewUserUsecase(get<_i19.SignUpRepository>()));
  gh.factory<_i33.PostStoreDataUsecase>(
      () => _i33.PostStoreDataUsecase(get<_i21.StoreRepository>()));
  gh.factory<_i34.SignupCubit>(
      () => _i34.SignupCubit(get<_i32.PostNewUserUsecase>()));
  gh.factory<_i35.SplashCubit>(
      () => _i35.SplashCubit(get<_i31.PostLoginUsecase>()));
  gh.factory<_i36.StoreCubit>(
      () => _i36.StoreCubit(get<_i26.GetStoreDataUsecase>()));
  gh.factory<_i37.LoginCubit>(
      () => _i37.LoginCubit(get<_i31.PostLoginUsecase>()));
  return get;
}
