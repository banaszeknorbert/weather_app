import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/data/model/weather.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/weather?lat={lat}&lon={lon}&appid={apiKey}')
  Future<Weather> getWeatherForPosition(
      {@Query('lat') required double lat,
      @Query('lon') required double lon,
      @Query('apiKey') required String apiKey});

  @GET('/weather?q={city}&appid={apiKey}')
  Future<Weather> getWeatherForCityName(
      {@Query('q') required String city,
      @Query('apiKey') required String apiKey});
}
