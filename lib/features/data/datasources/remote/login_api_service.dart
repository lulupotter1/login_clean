import 'package:injectable/injectable.dart';
import 'package:registration_test/core/constant/constants.dart';
import 'package:registration_test/features/data/models/login_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: loginApiBaseUrl)
@Injectable()
abstract class LoginApiService {
  @factoryMethod
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST("api/v1/auth/login")
  Future<HttpResponse<LoginModel>> getLogin(
    @Body() Map<String, dynamic> data,
  );
}
