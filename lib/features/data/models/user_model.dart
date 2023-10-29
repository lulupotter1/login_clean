import 'package:json_annotation/json_annotation.dart';
import 'package:registration_test/core/usecases/data_mapper.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends DataMapper<UserEntity> {
  final int id;
  final String? email;
  final String? nickname;

  UserModel({
    required this.id,
    this.email,
    this.nickname,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) => _$UserModelFromJson(map);

  @override
  UserEntity mapToEntity() {
    return UserEntity(
      id: id,
      email: email,
      nickname: nickname,
    );
  }
}
