import 'package:bloc/bloc.dart';
import 'package:doctor_appointment/core/network/api_service.dart';
import 'package:doctor_appointment/features/home/data/model/home_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
 final ApiService _api = ApiService();
 HomeModel? _doctors;
  HomeCubit() : super(HomeInitial());



Future<HomeModel?> getDoctor () async {
  emit(HomeLoading());
  try {
    final response = await _api.get('/home/index');
    final doctors = HomeModel.fromJson(response);
   print('======================= $doctors');
    emit(HomeLoaded(home: doctors));
  }catch(e){
    emit(HomeError(message: e.toString()));

  }
}
}
