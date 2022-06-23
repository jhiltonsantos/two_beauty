// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/2beauty/data/datasources/login_local_datasource.dart'
    as _i11;
import '../../features/2beauty/data/datasources/login_local_datasource_impl.dart'
    as _i12;
import '../../features/2beauty/data/repositories/appointment_repository_impl.dart'
    as _i4;
import '../../features/2beauty/data/repositories/home_repository_impl.dart'
    as _i10;
import '../../features/2beauty/data/repositories/login_repository_impl.dart'
    as _i34;
import '../../features/2beauty/data/repositories/owner_repository.dart' as _i15;
import '../../features/2beauty/data/repositories/profile_repository_imp.dart'
    as _i20;
import '../../features/2beauty/data/repositories/service_repository.dart'
    as _i21;
import '../../features/2beauty/data/repositories/sign_up_repository_impl.dart'
    as _i23;
import '../../features/2beauty/data/repositories/store_repository_impl.dart'
    as _i25;
import '../../features/2beauty/domain/repositories/appointment_repository.dart'
    as _i3;
import '../../features/2beauty/domain/repositories/home_repository.dart' as _i9;
import '../../features/2beauty/domain/repositories/login_repository.dart'
    as _i33;
import '../../features/2beauty/domain/repositories/profile_repository.dart'
    as _i19;
import '../../features/2beauty/domain/repositories/sign_up_repository.dart'
    as _i22;
import '../../features/2beauty/domain/repositories/store_repository.dart'
    as _i24;
import '../../features/2beauty/domain/usecases/agenda/get_all_appointment_data_usecase.dart'
    as _i6;
import '../../features/2beauty/domain/usecases/agenda/post_appointment_data_usecase.dart'
    as _i16;
import '../../features/2beauty/domain/usecases/home/get_user_data_usecase.dart'
    as _i31;
import '../../features/2beauty/domain/usecases/home/logout_user_usecase.dart'
    as _i35;
import '../../features/2beauty/domain/usecases/login/get_login_usecase.dart'
    as _i42;
import '../../features/2beauty/domain/usecases/login/post_login_usecase.dart'
    as _i36;
import '../../features/2beauty/domain/usecases/owner/post_new_owner_usecase.dart'
    as _i17;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_id.dart'
    as _i28;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_usecase.dart'
    as _i29;
import '../../features/2beauty/domain/usecases/service/get_all_service_data_usecase.dart'
    as _i7;
import '../../features/2beauty/domain/usecases/service/get_service_data_usecase.dart'
    as _i8;
import '../../features/2beauty/domain/usecases/service/post_service_data_usecase.dart'
    as _i18;
import '../../features/2beauty/domain/usecases/sign_up/post_new_user_usecase.dart'
    as _i37;
import '../../features/2beauty/domain/usecases/store/get_all_store_data_usecase.dart'
    as _i27;
import '../../features/2beauty/domain/usecases/store/get_store_data_usecase.dart'
    as _i30;
import '../../features/2beauty/domain/usecases/store/post_store_data_usecase.dart'
    as _i38;
import '../../features/2beauty/presentation/bloc/appointment/appointment_cubit.dart'
    as _i26;
import '../../features/2beauty/presentation/bloc/bottom_navy/bottom_navy_cubit.dart'
    as _i41;
import '../../features/2beauty/presentation/bloc/create_store/create_store_cubit.dart'
    as _i5;
import '../../features/2beauty/presentation/bloc/home/home_cubit.dart' as _i32;
import '../../features/2beauty/presentation/bloc/login/login_cubit.dart'
    as _i43;
import '../../features/2beauty/presentation/bloc/signUp/signup_cubit.dart'
    as _i39;
import '../../features/2beauty/presentation/bloc/splash/splash_cubit.dart'
    as _i44;
import '../../features/2beauty/presentation/bloc/store/store_cubit.dart'
    as _i40;
import '../../features/2beauty/presentation/resources/widgets/logout_modal.dart'
    as _i13;
import '../platform/network_info.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppointmentRepository>(() => _i4.AppointmentRepositoryImpl());
  gh.factory<_i5.CreateStoreCubit>(() => _i5.CreateStoreCubit());
  gh.factory<_i6.GetAllAppointmentDataUsecase>(
      () => _i6.GetAllAppointmentDataUsecase(get<_i3.AppointmentRepository>()));
  gh.factory<_i7.GetAllServiceDataUsecase>(
      () => _i7.GetAllServiceDataUsecase());
  gh.factory<_i8.GetServiceDataUsecase>(() => _i8.GetServiceDataUsecase());
  gh.factory<_i9.HomeRepository>(() => _i10.HomeRepositoryImpl());
  gh.factory<_i11.LoginLocalDataSource>(() => _i12.LoginLocalDataSourceImpl());
  gh.factory<_i13.LogoutModal>(() => _i13.LogoutModal());
  gh.factory<_i14.NetworkInfo>(() => _i14.NetworkInfoImpl());
  gh.factory<_i15.OwnerRepository>(() => _i15.OwnerRepository());
  gh.factory<_i16.PostAppointmentDataUsecase>(
      () => _i16.PostAppointmentDataUsecase(get<_i3.AppointmentRepository>()));
  gh.factory<_i17.PostNewOwnerUsecase>(() => _i17.PostNewOwnerUsecase());
  gh.factory<_i18.PostServiceDataUsecase>(() => _i18.PostServiceDataUsecase());
  gh.factory<_i19.ProfileRepository>(() => _i20.ProfileRepositoryImp());
  gh.factory<_i21.ServiceRepository>(() => _i21.ServiceRepository());
  gh.factory<_i22.SignUpRepository>(() => _i23.SignUpRepositoryImpl(
      get<_i11.LoginLocalDataSource>(), get<_i14.NetworkInfo>()));
  gh.factory<_i24.StoreRepository>(() => _i25.StoreRepositoryImpl());
  gh.factory<_i26.AppointmentCubit>(
      () => _i26.AppointmentCubit(get<_i16.PostAppointmentDataUsecase>()));
  gh.factory<_i27.GetAllStoreDataUsecase>(
      () => _i27.GetAllStoreDataUsecase(get<_i24.StoreRepository>()));
  gh.factory<_i28.GetCurrentProfileID>(
      () => _i28.GetCurrentProfileID(get<_i19.ProfileRepository>()));
  gh.factory<_i29.GetCurrentProfileUsecase>(
      () => _i29.GetCurrentProfileUsecase(get<_i19.ProfileRepository>()));
  gh.factory<_i30.GetStoreDataUsecase>(
      () => _i30.GetStoreDataUsecase(get<_i24.StoreRepository>()));
  gh.factory<_i31.GetUserDataUsecase>(
      () => _i31.GetUserDataUsecase(get<_i9.HomeRepository>()));
  gh.factory<_i32.HomeCubit>(() => _i32.HomeCubit(
      get<_i31.GetUserDataUsecase>(), get<_i27.GetAllStoreDataUsecase>()));
  gh.factory<_i33.LoginRepository>(() => _i34.LoginRepositoryImpl(
      loginLocalData: get<_i11.LoginLocalDataSource>(),
      networkInfo: get<_i14.NetworkInfo>()));
  gh.factory<_i35.LogoutUserUsecase>(
      () => _i35.LogoutUserUsecase(get<_i33.LoginRepository>()));
  gh.factory<_i36.PostLoginUsecase>(
      () => _i36.PostLoginUsecase(get<_i33.LoginRepository>()));
  gh.factory<_i37.PostNewUserUsecase>(
      () => _i37.PostNewUserUsecase(get<_i22.SignUpRepository>()));
  gh.factory<_i38.PostStoreDataUsecase>(
      () => _i38.PostStoreDataUsecase(get<_i24.StoreRepository>()));
  gh.factory<_i39.SignupCubit>(
      () => _i39.SignupCubit(get<_i37.PostNewUserUsecase>()));
  gh.factory<_i40.StoreCubit>(
      () => _i40.StoreCubit(get<_i30.GetStoreDataUsecase>()));
  gh.factory<_i41.BottomNavyCubit>(
      () => _i41.BottomNavyCubit(get<_i35.LogoutUserUsecase>()));
  gh.factory<_i42.GetLoginUsecase>(
      () => _i42.GetLoginUsecase(get<_i33.LoginRepository>()));
  gh.factory<_i43.LoginCubit>(
      () => _i43.LoginCubit(get<_i36.PostLoginUsecase>()));
  gh.factory<_i44.SplashCubit>(() => _i44.SplashCubit(
      get<_i36.PostLoginUsecase>(), get<_i42.GetLoginUsecase>()));
  return get;
}
