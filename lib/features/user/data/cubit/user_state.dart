import 'package:doctor_appointment/features/user/data/model/user_model.dart';


abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserResponse users;
  UserLoaded(this.users);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class LogoutInitial extends UserState {}

class LogoutLoading extends UserState {}

class LogoutLoaded extends UserState {
  
}

class LogoutError extends UserState {
  final String message;
  LogoutError(this.message);
}
