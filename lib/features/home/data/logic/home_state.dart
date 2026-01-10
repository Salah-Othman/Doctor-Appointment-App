part of 'home_cubit.dart';


abstract class HomeState {}

 class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final HomeModel home;
  HomeLoaded({required this.home});
}
class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
