part of 'appointment_cubit.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final AppointmentResponse appointment;
  AppointmentLoaded({required this.appointment});
}

class AppointmentError extends AppointmentState {}
