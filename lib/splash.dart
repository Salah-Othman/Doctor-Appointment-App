import 'package:doctor_appointment/features/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset('assets/splash/background.png')),
          Center(
            child: SvgPicture.asset('assets/logo.svg', width: 168, height: 72),
          ),
        ],
      ),
    );
  }
}
