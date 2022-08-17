import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/data/model/weather.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/onecall')
  Future<Weather> getWeatherForPosition({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('appid') required String apiKey,
  });

  @GET('/onecall?unit=metric')
  Future<Weather> getWeatherForCityName({
    @Query('q') required String city,
    @Query('appid') required String apiKey,
  });
}
