part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}

final class LoginSuccess extends LoginState {
  final User user;
  LoginSuccess( this.user);
}

final class LoginLogout extends LoginState {}