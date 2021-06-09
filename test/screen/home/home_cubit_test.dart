import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_app/data/repository/crash/crash_repository.dart';
import 'package:weather_app/data/repository/location/location_repository.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';
import 'home_cubit_test.mocks.dart';
import 'package:weather_app/screen/home/home_cubit.dart';

import '../../mocks/model_mocks.dart';

@GenerateMocks([WeatherRepository, LocationRepository, CrashRepository])
void main() {
  group('HomeCubit tests', () {
    final MockWeatherRepository _mockWeatherRepository =
        MockWeatherRepository();
    final MockLocationRepository _mockLocationRepository =
        MockLocationRepository();
    final MockCrashRepository _mockCrashRepository = MockCrashRepository();

    setUp(() {
      when(_mockWeatherRepository.getWeatherForPosition(
              coordsMock.lat, coordsMock.lon))
          .thenAnswer((_) => Future.value(weatherForLocation));
      when(_mockWeatherRepository.getWeatherForCityName('Warsaw'))
          .thenAnswer((_) async => weatherForCity);
    });

    blocTest(
        'Should get weather for city - Warsaw when getCurrentLocation returns null',
        build: () {
          when(_mockLocationRepository.getCurrentLocation())
              .thenAnswer((_) => Future.value(null));

          return HomeCubit(
            _mockWeatherRepository,
            _mockLocationRepository,
            _mockCrashRepository,
          );
        },
        act: (HomeCubit cubit) => cubit.getWeatherData(),
        expect: () => [
              const HomeState.loading(),
              const HomeState.success(weatherForCity)
            ]);

    blocTest(
        'Should get weather for location when getCurrentLocation returns correct coordinates',
        build: () {
          when(_mockLocationRepository.getCurrentLocation())
              .thenAnswer((_) => Future.value(coordsMock));

          return HomeCubit(
            _mockWeatherRepository,
            _mockLocationRepository,
            _mockCrashRepository,
          );
        },
        act: (HomeCubit cubit) => cubit.getWeatherData(),
        expect: () => [
          const HomeState.loading(),
          const HomeState.success(weatherForLocation)
        ]);
  });
}
