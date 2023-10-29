import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:registration_test/core/resources/dio_interceptor.dart';

@module
abstract class DioProvider {
  @singleton
  Dio dio() {
    Dio dio = Dio();

    dio.interceptors.add(TokenInterceptor());
    return dio;
  }
}
