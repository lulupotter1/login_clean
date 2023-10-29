import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:registration_test/core/resources/data_state.dart';
import 'package:registration_test/features/data/datasources/remote/login_api_service.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';
import 'package:registration_test/features/domain/repositories/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService _loginApiService;

  LoginRepositoryImpl(this._loginApiService);

  @override
  Future<DataState<LoginEntity>> getLogin({
    required Map<String, dynamic> data,
  }) async {
    try {
      final httpResponse = await _loginApiService.getLogin(data);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.mapToEntity());
      } else {
        return DataFailed(
          DioException(
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
