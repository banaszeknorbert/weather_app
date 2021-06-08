import 'package:weather_app/data/model/coords.dart';
import 'package:weather_app/data/model/weather.dart';

const coordsMock = Coords(latitude: 50.1, longitude: 10.1);

const weatherDataMock =
    WeatherData(id: 100, main: '', description: 'description', icon: 'icon');

const mainDataMock = MainData(temp: 20.2, pressure: 1000, humidity: 100);

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
