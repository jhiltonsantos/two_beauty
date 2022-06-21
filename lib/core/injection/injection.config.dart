// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/2beauty/data/datasources/login_local_datasource.dart'
    as _i10;
import '../../features/2beauty/data/datasources/login_local_datasource_impl.dart'
    as _i11;
import '../../features/2beauty/data/repositories/agenda_repository.dart' as _i3;
import '../../features/2beauty/data/repositories/home_repository_impl.dart'
    as _i9;
import '../../features/2beauty/data/repositories/login_repository_impl.dart'
    as _i31;
import '../../features/2beauty/data/repositories/owner_repository.dart' as _i13;
import '../../features/2beauty/data/repositories/profile_repository_imp.dart'
    as _i18;
import '../../features/2beauty/data/repositories/service_repository.dart'
    as _i19;
import '../../features/2beauty/data/repositories/sign_up_repository_impl.dart'
    as _i21;
import '../../features/2beauty/data/repositories/store_repository_impl.dart'
    as _i23;
import '../../features/2beauty/domain/repositories/home_repository.dart' as _i8;
import '../../features/2beauty/domain/repositories/login_repository.dart'
    as _i30;
import '../../features/2beauty/domain/repositories/profile_repository.dart'
    as _i17;
import '../../features/2beauty/domain/repositories/sign_up_repository.dart'
    as _i20;
import '../../features/2beauty/domain/repositories/store_repository.dart'
    as _i22;
import '../../features/2beauty/domain/usecases/agenda/get_all_agenda_data_usecase.dart'
    as _i5;
import '../../features/2beauty/domain/usecases/agenda/post_agenda_data_usecase.dart'
    as _i14;
import '../../features/2beauty/domain/usecases/home/get_user_data_usecase.dart'
    as _i28;
import '../../features/2beauty/domain/usecases/home/logout_user_usecase.dart'
    as _i32;
import '../../features/2beauty/domain/usecases/login/get_login_usecase.dart'
    as _i39;
import '../../features/2beauty/domain/usecases/login/post_login_usecase.dart'
    as _i33;
import '../../features/2beauty/domain/usecases/owner/post_new_owner_usecase.dart'
    as _i15;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_id.dart'
    as _i25;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_usecase.dart'
    as _i26;
import '../../features/2beauty/domain/usecases/service/get_all_service_data_usecase.dart'
    as _i6;
import '../../features/2beauty/domain/usecases/service/get_service_data_usecase.dart'
    as _i7;
import '../../features/2beauty/domain/usecases/service/post_service_data_usecase.dart'
    as _i16;
import '../../features/2beauty/domain/usecases/sign_up/post_new_user_usecase.dart'
    as _i34;
import '../../features/2beauty/domain/usecases/store/get_all_store_data_usecase.dart'
    as _i24;
import '../../features/2beauty/domain/usecases/store/get_store_data_usecase.dart'
    as _i27;
import '../../features/2beauty/domain/usecases/store/post_store_data_usecase.dart'
    as _i35;
import '../../features/2beauty/presentation/bloc/bottom_navy/bottom_navy_cubit.dart'
    as _i38;
import '../../features/2beauty/presentation/bloc/create_store/create_store_cubit.dart'
    as _i4;
import '../../features/2beauty/presentation/bloc/home/home_cubit.dart' as _i29;
import '../../features/2beauty/presentation/bloc/login/login_cubit.dart'
    as _i40;
import '../../features/2beauty/presentation/bloc/signUp/signup_cubit.dart'
    as _i36;
import '../../features/2beauty/presentation/bloc/splash/splash_cubit.dart'
    as _i41;
import '../../features/2beauty/presentation/bloc/store/store_cubit.dart'
    as _i37;
import '../platform/network_info.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AgendaRepository>(() => _i3.AgendaRepository());
  gh.factory<_i4.CreateStoreCubit>(() => _i4.CreateStoreCubit());
  gh.factory<_i5.GetAllAgendaDataUsecase>(() => _i5.GetAllAgendaDataUsecase());
  gh.factory<_i6.GetAllServiceDataUsecase>(
      () => _i6.GetAllServiceDataUsecase());
  gh.factory<_i7.GetServiceDataUsecase>(() => _i7.GetServiceDataUsecase());
  gh.factory<_i8.HomeRepository>(() => _i9.HomeRepositoryImpl());
  gh.factory<_i10.LoginLocalDataSource>(() => _i11.LoginLocalDataSourceImpl());
  gh.factory<_i12.NetworkInfo>(() => _i12.NetworkInfoImpl());
  gh.factory<_i13.OwnerRepository>(() => _i13.OwnerRepository());
  gh.factory<_i14.PostAgendaDataUsecase>(() => _i14.PostAgendaDataUsecase());
  gh.factory<_i15.PostNewOwnerUsecase>(() => _i15.PostNewOwnerUsecase());
  gh.factory<_i16.PostServiceDataUsecase>(() => _i16.PostServiceDataUsecase());
  gh.factory<_i17.ProfileRepository>(() => _i18.ProfileRepositoryImp());
  gh.factory<_i19.ServiceRepository>(() => _i19.ServiceRepository());
  gh.factory<_i20.SignUpRepository>(() => _i21.SignUpRepositoryImpl(
      get<_i10.LoginLocalDataSource>(), get<_i12.NetworkInfo>()));
  gh.factory<_i22.StoreRepository>(() => _i23.StoreRepositoryImpl());
  gh.factory<_i24.GetAllStoreDataUsecase>(
      () => _i24.GetAllStoreDataUsecase(get<_i22.StoreRepository>()));
  gh.factory<_i25.GetCurrentProfileID>(
      () => _i25.GetCurrentProfileID(get<_i17.ProfileRepository>()));
  gh.factory<_i26.GetCurrentProfileUsecase>(
      () => _i26.GetCurrentProfileUsecase(get<_i17.ProfileRepository>()));
  gh.factory<_i27.GetStoreDataUsecase>(
      () => _i27.GetStoreDataUsecase(get<_i22.StoreRepository>()));
  gh.factory<_i28.GetUserDataUsecase>(
      () => _i28.GetUserDataUsecase(get<_i8.HomeRepository>()));
  gh.factory<_i29.HomeCubit>(() => _i29.HomeCubit(
      get<_i28.GetUserDataUsecase>(), get<_i24.GetAllStoreDataUsecase>()));
  gh.factory<_i30.LoginRepository>(() => _i31.LoginRepositoryImpl(
      loginLocalData: get<_i10.LoginLocalDataSource>(),
      networkInfo: get<_i12.NetworkInfo>()));
  gh.factory<_i32.LogoutUserUsecase>(
      () => _i32.LogoutUserUsecase(get<_i30.LoginRepository>()));
  gh.factory<_i33.PostLoginUsecase>(
      () => _i33.PostLoginUsecase(get<_i30.LoginRepository>()));
  gh.factory<_i34.PostNewUserUsecase>(
      () => _i34.PostNewUserUsecase(get<_i20.SignUpRepository>()));
  gh.factory<_i35.PostStoreDataUsecase>(
      () => _i35.PostStoreDataUsecase(get<_i22.StoreRepository>()));
  gh.factory<_i36.SignupCubit>(
      () => _i36.SignupCubit(get<_i34.PostNewUserUsecase>()));
  gh.factory<_i37.StoreCubit>(
      () => _i37.StoreCubit(get<_i27.GetStoreDataUsecase>()));
  gh.factory<_i38.BottomNavyCubit>(
      () => _i38.BottomNavyCubit(get<_i32.LogoutUserUsecase>()));
  gh.factory<_i39.GetLoginUsecase>(
      () => _i39.GetLoginUsecase(get<_i30.LoginRepository>()));
  gh.factory<_i40.LoginCubit>(
      () => _i40.LoginCubit(get<_i33.PostLoginUsecase>()));
  gh.factory<_i41.SplashCubit>(() => _i41.SplashCubit(
      get<_i33.PostLoginUsecase>(), get<_i39.GetLoginUsecase>()));
  return get;
}
