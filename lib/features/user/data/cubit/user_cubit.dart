import 'package:doctor_appointment/core/network/api_service.dart';
import 'package:doctor_appointment/features/user/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  ApiService api = ApiService();

  UserCubit() : super(UserInitial());

  Future<void> fetchUsers() async {
    emit(UserLoading());
    try {
      final response = await api.get(
        '/user/profile',
      ); // users is List<UserModel>
      emit(UserLoaded(UserResponse.fromJson(response))); // ✅ NO .data
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(LogoutLoading());
    try {
      final res = await api.post('/auth/logout', {});
      emit(LogoutLoaded());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}
