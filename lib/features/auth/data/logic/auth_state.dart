part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

/// SignIn

class SignInLoading extends AuthState {}

class SignInLoaded extends AuthState {
  final SigninModel user;
  SignInLoaded({required this.user});


}

class SignInError extends AuthState {
  final String message;

  SignInError({required this.message});
}

/// SignUp

class SignUpLoading extends AuthState {}

class SignUpLoaded extends AuthState {}

class SignUpError extends AuthState {
  final String message;

  SignUpError({required this.message});
}

/// Get User
final class GetUserSuccess extends AuthState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends AuthState {}

final class GetUserError extends AuthState {
  final String message;

  GetUserError({required this.message});
}
