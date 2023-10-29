import 'package:json_annotation/json_annotation.dart';
import 'package:registration_test/core/usecases/data_mapper.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends DataMapper<TokenEntity> {
  final String accessToken;
  final String refreshToken;

  TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> map) => _$TokenModelFromJson(map);

  @override
  TokenEntity mapToEntity() {
    return TokenEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
