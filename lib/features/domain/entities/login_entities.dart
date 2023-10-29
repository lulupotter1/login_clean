import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final UserEntity? userData;
  final TokenEntity? tokenData;

  const LoginEntity({
    this.userData,
    this.tokenData,
  });

  @override
  List<Object?> get props => [
        userData,
        tokenData,
      ];
}

class UserEntity extends Equatable {
  final int id;
  final String? email;
  final String? nickname;

  const UserEntity({
    this.email,
    this.nickname,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        nickname,
      ];
}

class TokenEntity extends Equatable {
  final String accessToken;
  final String refreshToken;

  const TokenEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}
