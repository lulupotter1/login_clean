import 'package:registration_test/core/resources/data_state.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';

abstract class LoginRepository {
  Future<DataState<LoginEntity>> getLogin({
    required Map<String, dynamic> data,
  });
}
