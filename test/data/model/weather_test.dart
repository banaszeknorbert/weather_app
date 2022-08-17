import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/model/weather.dart';

import '../../mocks/model_mocks.dart';

void main() {
  test('Weather toJson should return correct json', () {
    final json = weatherForCity.toJson();
    expect(json['name'], weatherForCity.name);
  });

  test('Weather fromJson should return correct object', () {
    final json = {
      'name': 'Warsaw',
      'coord': coordsMock.toJson(),
      'weather': [weatherDataMock.toJson()],
      'main': mainDataMock.toJson(),
    };
    final object = Weather.fromJson(json);
    expect(object, weatherForCity);
  });

  test('WeatherData toJson should return correct json', () {
    final json = weatherDataMock.toJson();
    expect(json['id'], weatherDataMock.id);
    expect(json['main'], weatherDataMock.main);
    expect(json['description'], weatherDataMock.description);
    expect(json['icon'], weatherDataMock.icon);
  });

  test('WeatherData fromJson should return correct object', () {
    final json = {
      'id': weatherDataMock.id,
      'main': weatherDataMock.main,
      'description': weatherDataMock.description,
      'icon': weatherDataMock.icon,
    };
    final object = WeatherData.fromJson(json);
    expect(object, weatherDataMock);
  });

  test('MainData toJson should return correct json', () {
    final json = mainDataMock.toJson();
    expect(json['humidity'], mainDataMock.humidity);
    expect(json['pressure'], mainDataMock.pressure);
    expect(json['temp'], mainDataMock.temp);
  });

  test('MainData fromJson should return correct object', () {
    final json = {
      'humidity': mainDataMock.humidity,
      'pressure': mainDataMock.pressure,
      'temp': mainDataMock.temp,
    };
    final object = MainData.fromJson(json);
    expect(object, mainDataMock);
  });
}
