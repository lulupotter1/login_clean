part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  final UserEntity data;

  const LoginLoaded({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}

final class LoginFailure extends LoginState {
  final String errorMessage;
  const LoginFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [
        errorMessage,
      ];
}
