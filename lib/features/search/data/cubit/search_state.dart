import 'package:doctor_appointment/features/search/data/model/search_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class DoctorSearchInitial extends SearchState {}

class DoctorSearchLoading extends SearchState {}

class DoctorSearchSuccess extends SearchState {
  final List<SearchModel> doctors;
  final String searchQuery;

  const DoctorSearchSuccess({
    required this.doctors,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [doctors, searchQuery];
}

class DoctorSearchEmpty extends SearchState {
  final String searchQuery;

  const DoctorSearchEmpty({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}

class DoctorSearchError extends SearchState {
  final String message;

  const DoctorSearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
