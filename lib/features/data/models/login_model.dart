import 'package:registration_test/features/domain/entities/login_entities.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required UserModel userData,
    required TokenModel tokenData,
  }) : super(
          userData: userData,
          tokenData: tokenData,
        );

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      userData: UserModel.fromJson(map['user'] as Map<String, dynamic>),
      tokenData: TokenModel.fromJson(map['tokens'] as Map<String, dynamic>),
    );
  }
}

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    String? email,
    String? nickname,
  }) : super(
          id: id,
          email: email,
          nickname: nickname,
        );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      nickname: map['nickname'],
    );
  }
}

class TokenModel extends TokenEntity {
  const TokenModel({
    required String accessToken,
    required String refreshToken,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory TokenModel.fromJson(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}
