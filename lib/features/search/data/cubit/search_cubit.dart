import 'package:doctor_appointment/core/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ApiService _apiService;

  SearchCubit({required ApiService apiService})
    : _apiService = apiService,
      super(DoctorSearchInitial());

  Future<void> searchDoctors(String query) async {
    if (query.trim().isEmpty) {
      emit(DoctorSearchInitial());
      return;
    }

    emit(DoctorSearchLoading());

    try {
      final doctors = await _apiService.searchDoctors(query);

      if (doctors.isEmpty) {
        emit(DoctorSearchEmpty(searchQuery: query));
      } else {
        emit(DoctorSearchSuccess(doctors: doctors, searchQuery: query));
      }
    } catch (e) {
      emit(DoctorSearchError(message: e.toString()));
    }
  }

  void resetSearch() {
    emit(DoctorSearchInitial());
  }
}
