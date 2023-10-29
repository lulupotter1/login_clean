import 'package:json_annotation/json_annotation.dart';
import 'package:registration_test/core/usecases/data_mapper.dart';
import 'package:registration_test/features/data/models/token_model.dart';
import 'package:registration_test/features/data/models/user_model.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends DataMapper<LoginEntity> {
  @JsonKey(name: "user")
  final UserModel userData;

  @JsonKey(name: "tokens")
  final TokenModel tokenData;
  LoginModel({
    required this.tokenData,
    required this.userData,
  });

  factory LoginModel.fromJson(Map<String, dynamic> map) => _$LoginModelFromJson(map);

  @override
  LoginEntity mapToEntity() {
    return LoginEntity(
      userData: userData.mapToEntity(),
      tokenData: tokenData.mapToEntity(),
    );
  }
}
