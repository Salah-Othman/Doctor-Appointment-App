import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/network/api_service.dart';
import 'package:doctor_appointment/features/auth/data/model/signin_model.dart';
import 'package:doctor_appointment/features/auth/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_exceptions.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/utils/pref_helper.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService api = ApiService();
  SigninModel? _user;

  AuthCubit() : super(AuthInitial());

  /// SignIn
  Future<SigninModel?> signIn(String email, String password) async {
    emit(SignInLoading());
    try {
      final response = await api.post('/auth/login', {
        'email': email,
        'password': password,
      });
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];

        print('📡 Login response - code: $code, data: $data');

        if (code != 200 && code != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        final user = SigninModel.fromJson(data);
        print('🔐 Login successful - User token: ${user.token ?? 'null'}');

        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
          print('💾 Token saved to storage: ${user.token}');
        } else {
          print('⚠️ No token received from server!');
        }


        _user = user;
        emit(SignInLoaded(user: user));
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      emit(SignInError(message: ApiExceptions
          .handleError(e)
          .message));
      throw ApiExceptions.handleError(e);
    } catch (e) {
      emit(SignInError(message: e.toString()));

      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel?> getUser() async {
    emit(GetUserLoading());
    try{
      final response = await api.get('/user/profile');
      final user = UserModel.fromjson(response);
      emit(GetUserSuccess(user: user));

    }catch(e){
      emit(GetUserError(message: e.toString()));
    }
  }
}
