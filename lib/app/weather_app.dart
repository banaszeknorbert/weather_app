import 'package:flutter/material.dart';
import 'package:weather_app/screen/splash/splash_screen.dart';
import 'package:weather_app/theme/app_theme.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: SplashScreen(),
    );
  }
}
