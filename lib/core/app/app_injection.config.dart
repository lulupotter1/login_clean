// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/datasources/remote/login_api_service.dart' as _i4;
import '../../features/data/repositories/login_repository_impl.dart' as _i6;
import '../../features/domain/repositories/login_repository.dart' as _i5;
import '../../features/domain/usecases/get_login.dart' as _i8;
import '../../features/presentation/blocs/login_bloc/login_bloc.dart' as _i9;
import '../../features/presentation/blocs/profile_bloc/profile_bloc.dart'
    as _i7;
import '../resources/dio_provider.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.singleton<_i3.Dio>(dioProvider.dio());
    gh.factory<_i4.LoginApiService>(() => _i4.LoginApiService(gh<_i3.Dio>()));
    gh.factory<_i5.LoginRepository>(
        () => _i6.LoginRepositoryImpl(gh<_i4.LoginApiService>()));
    gh.factory<_i7.ProfileBloc>(() => _i7.ProfileBloc());
    gh.factory<_i8.GetLoginUseCase>(
        () => _i8.GetLoginUseCase(gh<_i5.LoginRepository>()));
    gh.factory<_i9.LoginBloc>(() => _i9.LoginBloc(gh<_i8.GetLoginUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i10.DioProvider {}
