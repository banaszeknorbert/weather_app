import 'package:injectable/injectable.dart';
import 'package:weather_app/config/environment_config.dart';
import 'package:weather_app/data/api/api_service.dart';
import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';

@Singleton(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final ApiService _apiService;

  WeatherRepositoryImpl(this._apiService);

  @override
  Future<Weather> getWeatherForPosition(double lat, double lon) =>
      _apiService.getWeatherForPosition(
        lat: lat,
        lon: lon,
        apiKey: EnvironmentConfig.apiKey,
      );

  @override
  Future<Weather> getWeatherForCityName(String city) => _apiService
      .getWeatherForCityName(city: city, apiKey: EnvironmentConfig.apiKey);
}
