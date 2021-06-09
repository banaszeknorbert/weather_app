import 'package:flutter/material.dart';
import 'package:weather_app/app/weather_app.dart';
import 'package:weather_app/injection/injection.dart';

void main() {
  configureDependencies();
  runApp(WeatherApp());
}
