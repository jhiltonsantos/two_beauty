// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/2beauty/data/datasources/login_local_datasource.dart'
    as _i12;
import '../../features/2beauty/data/datasources/login_local_datasource_impl.dart'
    as _i13;
import '../../features/2beauty/data/repositories/appointment_repository_impl.dart'
    as _i5;
import '../../features/2beauty/data/repositories/home_repository_impl.dart'
    as _i11;
import '../../features/2beauty/data/repositories/login_repository_impl.dart'
    as _i35;
import '../../features/2beauty/data/repositories/owner_repository.dart' as _i16;
import '../../features/2beauty/data/repositories/profile_repository_imp.dart'
    as _i21;
import '../../features/2beauty/data/repositories/service_repository.dart'
    as _i22;
import '../../features/2beauty/data/repositories/sign_up_repository_impl.dart'
    as _i24;
import '../../features/2beauty/data/repositories/store_repository_impl.dart'
    as _i26;
import '../../features/2beauty/domain/repositories/appointment_repository.dart'
    as _i4;
import '../../features/2beauty/domain/repositories/home_repository.dart'
    as _i10;
import '../../features/2beauty/domain/repositories/login_repository.dart'
    as _i34;
import '../../features/2beauty/domain/repositories/profile_repository.dart'
    as _i20;
import '../../features/2beauty/domain/repositories/sign_up_repository.dart'
    as _i23;
import '../../features/2beauty/domain/repositories/store_repository.dart'
    as _i25;
import '../../features/2beauty/domain/usecases/agenda/get_all_appointment_data_usecase.dart'
    as _i7;
import '../../features/2beauty/domain/usecases/agenda/post_appointment_data_usecase.dart'
    as _i17;
import '../../features/2beauty/domain/usecases/home/get_user_data_usecase.dart'
    as _i32;
import '../../features/2beauty/domain/usecases/home/logout_user_usecase.dart'
    as _i36;
import '../../features/2beauty/domain/usecases/login/get_login_usecase.dart'
    as _i43;
import '../../features/2beauty/domain/usecases/login/post_login_usecase.dart'
    as _i37;
import '../../features/2beauty/domain/usecases/owner/post_new_owner_usecase.dart'
    as _i18;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_id.dart'
    as _i29;
import '../../features/2beauty/domain/usecases/profile/get_current_profile_usecase.dart'
    as _i30;
import '../../features/2beauty/domain/usecases/service/get_all_service_data_usecase.dart'
    as _i8;
import '../../features/2beauty/domain/usecases/service/get_service_data_usecase.dart'
    as _i9;
import '../../features/2beauty/domain/usecases/service/post_service_data_usecase.dart'
    as _i19;
import '../../features/2beauty/domain/usecases/sign_up/post_new_user_usecase.dart'
    as _i38;
import '../../features/2beauty/domain/usecases/store/get_all_store_data_usecase.dart'
    as _i28;
import '../../features/2beauty/domain/usecases/store/get_store_data_usecase.dart'
    as _i31;
import '../../features/2beauty/domain/usecases/store/post_store_data_usecase.dart'
    as _i39;
import '../../features/2beauty/presentation/bloc/appointment/appointment_cubit.dart'
    as _i27;
import '../../features/2beauty/presentation/bloc/bottom_navy/bottom_navy_cubit.dart'
    as _i42;
import '../../features/2beauty/presentation/bloc/create_store/create_store_cubit.dart'
    as _i6;
import '../../features/2beauty/presentation/bloc/home/home_cubit.dart' as _i33;
import '../../features/2beauty/presentation/bloc/login/login_cubit.dart'
    as _i44;
import '../../features/2beauty/presentation/bloc/signUp/signup_cubit.dart'
    as _i40;
import '../../features/2beauty/presentation/bloc/splash/splash_cubit.dart'
    as _i45;
import '../../features/2beauty/presentation/bloc/store/store_cubit.dart'
    as _i41;
import '../../features/2beauty/presentation/resources/widgets/appointment_completed_modal.dart'
    as _i3;
import '../../features/2beauty/presentation/resources/widgets/logout_modal.dart'
    as _i14;
import '../platform/network_info.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppointmentCompletedModal>(
      () => _i3.AppointmentCompletedModal());
  gh.factory<_i4.AppointmentRepository>(() => _i5.AppointmentRepositoryImpl());
  gh.factory<_i6.CreateStoreCubit>(() => _i6.CreateStoreCubit());
  gh.factory<_i7.GetAllAppointmentDataUsecase>(
      () => _i7.GetAllAppointmentDataUsecase(get<_i4.AppointmentRepository>()));
  gh.factory<_i8.GetAllServiceDataUsecase>(
      () => _i8.GetAllServiceDataUsecase());
  gh.factory<_i9.GetServiceDataUsecase>(() => _i9.GetServiceDataUsecase());
  gh.factory<_i10.HomeRepository>(() => _i11.HomeRepositoryImpl());
  gh.factory<_i12.LoginLocalDataSource>(() => _i13.LoginLocalDataSourceImpl());
  gh.factory<_i14.LogoutModal>(() => _i14.LogoutModal());
  gh.factory<_i15.NetworkInfo>(() => _i15.NetworkInfoImpl());
  gh.factory<_i16.OwnerRepository>(() => _i16.OwnerRepository());
  gh.factory<_i17.PostAppointmentDataUsecase>(
      () => _i17.PostAppointmentDataUsecase(get<_i4.AppointmentRepository>()));
  gh.factory<_i18.PostNewOwnerUsecase>(() => _i18.PostNewOwnerUsecase());
  gh.factory<_i19.PostServiceDataUsecase>(() => _i19.PostServiceDataUsecase());
  gh.factory<_i20.ProfileRepository>(() => _i21.ProfileRepositoryImp());
  gh.factory<_i22.ServiceRepository>(() => _i22.ServiceRepository());
  gh.factory<_i23.SignUpRepository>(() => _i24.SignUpRepositoryImpl(
      get<_i12.LoginLocalDataSource>(), get<_i15.NetworkInfo>()));
  gh.factory<_i25.StoreRepository>(() => _i26.StoreRepositoryImpl());
  gh.factory<_i27.AppointmentCubit>(
      () => _i27.AppointmentCubit(get<_i17.PostAppointmentDataUsecase>()));
  gh.factory<_i28.GetAllStoreDataUsecase>(
      () => _i28.GetAllStoreDataUsecase(get<_i25.StoreRepository>()));
  gh.factory<_i29.GetCurrentProfileID>(
      () => _i29.GetCurrentProfileID(get<_i20.ProfileRepository>()));
  gh.factory<_i30.GetCurrentProfileUsecase>(
      () => _i30.GetCurrentProfileUsecase(get<_i20.ProfileRepository>()));
  gh.factory<_i31.GetStoreDataUsecase>(
      () => _i31.GetStoreDataUsecase(get<_i25.StoreRepository>()));
  gh.factory<_i32.GetUserDataUsecase>(
      () => _i32.GetUserDataUsecase(get<_i10.HomeRepository>()));
  gh.factory<_i33.HomeCubit>(() => _i33.HomeCubit(
      get<_i32.GetUserDataUsecase>(), get<_i28.GetAllStoreDataUsecase>()));
  gh.factory<_i34.LoginRepository>(() => _i35.LoginRepositoryImpl(
      loginLocalData: get<_i12.LoginLocalDataSource>(),
      networkInfo: get<_i15.NetworkInfo>()));
  gh.factory<_i36.LogoutUserUsecase>(
      () => _i36.LogoutUserUsecase(get<_i34.LoginRepository>()));
  gh.factory<_i37.PostLoginUsecase>(
      () => _i37.PostLoginUsecase(get<_i34.LoginRepository>()));
  gh.factory<_i38.PostNewUserUsecase>(
      () => _i38.PostNewUserUsecase(get<_i23.SignUpRepository>()));
  gh.factory<_i39.PostStoreDataUsecase>(
      () => _i39.PostStoreDataUsecase(get<_i25.StoreRepository>()));
  gh.factory<_i40.SignupCubit>(
      () => _i40.SignupCubit(get<_i38.PostNewUserUsecase>()));
  gh.factory<_i41.StoreCubit>(
      () => _i41.StoreCubit(get<_i31.GetStoreDataUsecase>()));
  gh.factory<_i42.BottomNavyCubit>(
      () => _i42.BottomNavyCubit(get<_i36.LogoutUserUsecase>()));
  gh.factory<_i43.GetLoginUsecase>(
      () => _i43.GetLoginUsecase(get<_i34.LoginRepository>()));
  gh.factory<_i44.LoginCubit>(
      () => _i44.LoginCubit(get<_i37.PostLoginUsecase>()));
  gh.factory<_i45.SplashCubit>(() => _i45.SplashCubit(
      get<_i37.PostLoginUsecase>(), get<_i43.GetLoginUsecase>()));
  return get;
}
