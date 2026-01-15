import 'package:dio/dio.dart';
import 'package:doctor_appointment/features/search/data/model/search_model.dart';

import 'api_exceptions.dart';
import 'dio_client.dart';

class ApiService {
  final DioClient _dioClient = DioClient();

  /// CRUD METHODS

  /// get
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //// Search
  Future<List<SearchModel>> searchDoctors(String name) async {
    try {
      final response = await _dioClient.dio.get(
        '/doctor/doctor-search',
        queryParameters: {'name': name},
      );

      if (response.statusCode == 200) {
        final data = response.data;

        // Handle different response structures
        if (data is Map<String, dynamic>) {
          // Check if data is wrapped in a 'data' key
          final doctorsData = data['data'] ?? data;

          if (doctorsData is List) {
            return doctorsData
                .map((json) => SearchModel.fromJson(json as Map<String, dynamic>))
                .toList();
          }
        } else if (data is List) {
          return data
              .map((json) => SearchModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }

        return [];
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed to search doctors',
        );
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// post
  Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      final response = await _dioClient.dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// put || update
  Future<dynamic> put(String endPoint, dynamic body) async {
    try {
      final response = await _dioClient.dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// delete
  Future<dynamic> delete(String endPoint, dynamic body) async {
    try {
      final response = await _dioClient.dio.delete(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
