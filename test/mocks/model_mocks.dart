import 'package:location/location.dart';
import 'package:weather_app/data/model/coords.dart';
import 'package:weather_app/data/model/weather.dart';

const coordsMock = Coords(lat: 50.1, lon: 10.1);

final mockLocationData = LocationData.fromMap({
  'latitude': 50.1,
  'longitude': 10.1,
  'accuracy': 10.0,
  'altitude': 10.0,
  'speed': 10.0,
  'speed_accuracy': 10.0,
  'heading': 10.0,
  'time': 10.0,
  'isMock': true,
});

const weatherDataMock = WeatherData(
    id: 100, main: 'Cloudy', description: 'description', icon: 'icon');

const mainDataMock = MainData(temp: 20, pressure: 1000, humidity: 100);

const weatherForCity = Weather(
  name: 'Warsaw',
  weather: [weatherDataMock],
  coords: coordsMock,
  mainData: mainDataMock,
);

const weatherForLocation = Weather(
  name: 'Location',
  weather: [weatherDataMock],
  coords: coordsMock,
  mainData: mainDataMock,
);
