import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/repository/crash/crash_repository.dart';
import 'package:weather_app/data/repository/location/location_repository.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';
import 'package:weather_app/screen/home/home_cubit.dart';

import '../../mocks/model_mocks.dart';
import 'home_cubit_test.mocks.dart';

@GenerateMocks([WeatherRepository, LocationRepository, CrashRepository])
void main() {
  group('HomeCubit tests', () {
    final MockWeatherRepository mockWeatherRepository = MockWeatherRepository();
    final MockLocationRepository mockLocationRepository =
        MockLocationRepository();
    final MockCrashRepository mockCrashRepository = MockCrashRepository();

    setUp(() {
      when(mockLocationRepository.getCurrentLocation())
          .thenAnswer((_) async => coordsMock);
      when(
        mockWeatherRepository.getWeatherForPosition(
          coordsMock.lat,
          coordsMock.lon,
        ),
      ).thenAnswer((_) => Future.value(weatherForLocation));
      when(mockWeatherRepository.getWeatherForCityName('Warsaw'))
          .thenAnswer((_) async => weatherForCity);
    });

    blocTest(
      'Should get weather for city - Warsaw when getCurrentLocation returns null',
      build: () {
        when(mockLocationRepository.getCurrentLocation())
            .thenAnswer((_) => Future.value(null));

        return HomeCubit(
          mockWeatherRepository,
          mockLocationRepository,
          mockCrashRepository,
        );
      },
      act: (HomeCubit cubit) => cubit.getWeatherData(),
      expect: () => [
        const HomeState.loading(),
        const HomeState.success(weatherForCity),
      ],
    );

    blocTest(
      'Should get weather for location when getCurrentLocation returns correct coordinates',
      build: () {
        when(mockLocationRepository.getCurrentLocation())
            .thenAnswer((_) => Future.value(coordsMock));

        return HomeCubit(
          mockWeatherRepository,
          mockLocationRepository,
          mockCrashRepository,
        );
      },
      act: (HomeCubit cubit) => cubit.getWeatherData(),
      expect: () => [
        const HomeState.loading(),
        const HomeState.success(weatherForLocation)
      ],
    );
  });
}
