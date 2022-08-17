import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/config/environment_config.dart';

@module
abstract class DioModule {
  @singleton
  Dio dio() => _baseDio()
    ..interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));
}

Dio _baseDio() => Dio(_options(EnvironmentConfig.apiUrl));

BaseOptions _options(String baseUrl) => BaseOptions(baseUrl: baseUrl);
