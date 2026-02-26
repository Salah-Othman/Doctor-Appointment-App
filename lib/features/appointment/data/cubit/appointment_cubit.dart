import 'package:doctor_appointment/core/network/api_service.dart';
import 'package:doctor_appointment/features/appointment/data/model/appointment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  ApiService apiService = ApiService();
  AppointmentCubit() : super(AppointmentInitial());
  Future<AppointmentResponse?> fetchAppointments() async {
    try {
      emit(AppointmentLoading());
      final response = await apiService.get('/appointment/index');
      final appointmentResponse = AppointmentResponse.fromJson(response);
      // Handle the response as neede
      print('aaaa=== $appointmentResponse');
      emit(AppointmentLoaded(appointment: appointmentResponse));
    } catch (e) {
      emit(AppointmentError());
    }
  }
}
