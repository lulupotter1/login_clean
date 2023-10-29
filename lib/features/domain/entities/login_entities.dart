class LoginEntity {
  final UserEntity? userData;
  final TokenEntity? tokenData;

  const LoginEntity({
    this.userData,
    this.tokenData,
  });
}

class UserEntity {
  final int id;
  final String? email;
  final String? nickname;

  const UserEntity({
    this.email,
    this.nickname,
    required this.id,
  });
}

class TokenEntity {
  final String accessToken;
  final String refreshToken;

  const TokenEntity({
    required this.accessToken,
    required this.refreshToken,
  });
}
