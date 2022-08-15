import 'package:flutter/material.dart';
import 'package:weather_app/screen/home/home_screen.dart';
import 'package:weather_app/theme/gradients.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => Navigator.of(context).pushAndRemoveUntil(
        HomeScreen.build(),
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(gradient: defaultGradient),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 2,
        ),
      ),
    );
  }
}
