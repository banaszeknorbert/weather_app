import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/config/environment_config.dart';

@module
abstract class DioModule {
  @singleton
  Dio dio() => _baseDio();
  Dio _baseDio() => Dio(_options(EnvironmentConfig.apiUrl))
    ..interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));
  BaseOptions _options(String baseUrl) => BaseOptions(baseUrl: baseUrl);
}




