part of 'home_cubit.dart';


abstract class HomeState {}

 class HomeInitial extends HomeState {}
/// Home State
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final HomeModel home;
  HomeLoaded({required this.home});
}
class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
/// Speciality State
class SpecialityLoading extends HomeState {}
class SpecialityLoaded extends HomeState {
  final SpecialityModel speciality;
  SpecialityLoaded({required this.speciality});
}
class SpecialityError extends HomeState {
  final String message;
  SpecialityError({required this.message});
}