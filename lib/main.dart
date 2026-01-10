import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/utils/pref_helper.dart';

import 'package:doctor_appointment/features/auth/data/logic/auth_cubit.dart';
import 'package:doctor_appointment/features/auth/view/login_view.dart';
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
        BlocProvider(create: (_) => AuthCubit())
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Splash()),
    );
  }
}
