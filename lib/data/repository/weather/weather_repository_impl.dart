import 'package:injectable/injectable.dart';
import 'package:weather_app/config/environment_config.dart';
import 'package:weather_app/data/api/api_service.dart';
import 'package:weather_app/data/api/api_service_factory.dart';
import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';

@Singleton(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final ApiService _apiService;

  WeatherRepositoryImpl(ApiServiceFactory apiServiceFactory)
      : _apiService = apiServiceFactory.get();

  @override
  Future<Weather> getWeatherForPosition(double lat, double lon) =>
      _apiService.getWeatherForPosition(
          lat: lat, lon: lon, apiKey: EnvironmentConfig.apiKey);
}
