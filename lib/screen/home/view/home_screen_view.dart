import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/theme/gradients.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: _getBackgroundGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getWeatherIcon(),
            Text(
              weather.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              '${weather.mainData.temp.toStringAsFixed(0)}°C',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w400, fontSize: 40),
            )
          ],
        ),
      ),
    );
  }

  Widget _getWeatherIcon() {
    switch (weather.weather.first.main) {
      case 'Clear':
        return const Icon(FontAwesomeIcons.sun);
      case 'Sunny':
        return const Icon(FontAwesomeIcons.sun);
      case 'Rainy':
        return const Icon(FontAwesomeIcons.cloudRain);
      case 'Cloudy':
        return const Icon(FontAwesomeIcons.cloud);
      default:
        return const SizedBox();
    }
  }

  LinearGradient _getBackgroundGradient() {
    switch (weather.weather.first.main) {
      case 'Clear':
        return clearGradient;
      case 'Sunny':
        return sunnyGradient;
      case 'Rainy':
        return rainyGradient;
      case 'Cloudy':
        return cloudyGradient;
      default:
        return defaultGradient;
    }
  }
}
