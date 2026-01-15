import 'package:doctor_appointment/core/network/api_service.dart';
import 'package:doctor_appointment/features/auth/data/logic/auth_cubit.dart';
import 'package:doctor_appointment/features/search/data/cubit/search_cubit.dart';
import 'package:doctor_appointment/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (context) => SearchCubit(apiService: ApiService())),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Splash()),
    );
  }
}
