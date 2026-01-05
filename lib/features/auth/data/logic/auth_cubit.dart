import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/network/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_exceptions.dart';
import '../../../../core/utils/pref_helper.dart';
import '../model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  ApiService apiService = ApiService();
  UserModel? _currentUser;
  AuthCubit() : super(AuthInitial());

  /// Login
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post('/auth/login', {
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

        final user = UserModel.fromJson(data);
        print('🔐 Login successful - User token: ${user.token ?? 'null'}');

        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
          print('💾 Token saved to storage: ${user.token}');
        } else {
          print('⚠️ No token received from server!');
        }

        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// Signup
  Future<UserModel?> signup(String name, String email, String password) async {
    try {
      final response = await apiService.post('/register', {
        'name': name,
        'password': password,
        'email': email,
      });
      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final coder = int.tryParse(code);
        final data = response['data'];

        if (coder != 200 && coder != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        /// condtion assement
        final user = UserModel.fromJson(data);
        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
        }

        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// Get Profile data
  Future<UserModel?> getProfileData() async {
    try {
      final token = await PrefHelper.getToken();
      if (token == null || token == 'guest') {
        return null;
      }

      final response = await apiService.get('/profile');
      final user = UserModel.fromJson(response['data']);
      _currentUser = user;
      return user;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
  UserModel? get currentUser => _currentUser;
}
