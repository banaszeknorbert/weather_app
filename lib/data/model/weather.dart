// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/model/coords.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: 'coord') required Coords coords,
    required List<WeatherData> weather,
    @JsonKey(name: 'main') required MainData mainData,
    required String name,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> data) =>
      _$WeatherFromJson(data);
}

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> data) =>
      _$WeatherDataFromJson(data);
}

@freezed
class MainData with _$MainData {
  const factory MainData({
    required double temp,
    required int pressure,
    required int humidity,
  }) = _MainData;

  factory MainData.fromJson(Map<String, dynamic> data) =>
      _$MainDataFromJson(data);
}
