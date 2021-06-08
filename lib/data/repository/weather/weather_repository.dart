import 'package:weather_app/data/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherForPosition(double lat, double lon);
  Future<Weather> getWeatherForCityName(String city);
}
