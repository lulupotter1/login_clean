part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginGetLogin extends LoginEvent {
  final String login;

  final String password;

  const LoginGetLogin({
    required this.password,
    required this.login,
  });

  @override
  List<Object> get props => [
        password,
        login,
      ];
}
