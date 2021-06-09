import 'package:weather_app/data/model/coords.dart';
import 'package:weather_app/data/model/weather.dart';

const coordsMock = Coords(lat: 50.1, lon: 10.1);

const weatherDataMock =
    WeatherData(id: 100, main: 'Cloudy', description: 'description', icon: 'icon');

const mainDataMock = MainData(temp: 20, pressure: 1000, humidity: 100);

const weatherForCity = Weather(
    name: 'Warsaw',
    weather: [weatherDataMock],
    coords: coordsMock,
    mainData: mainDataMock);

const weatherForLocation = Weather(
    name: 'Location',
    weather: [weatherDataMock],
    coords: coordsMock,
    mainData: mainDataMock);
