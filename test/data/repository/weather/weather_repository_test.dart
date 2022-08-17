import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/api/api_service.dart';
import 'package:weather_app/data/repository/weather/weather_repository_impl.dart';

import '../../../mocks/model_mocks.dart';
import 'weather_repository_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
  });

  test('getWeatherForPosition should return correct weather for position',
      () async {
    when(
      mockApiService.getWeatherForPosition(
        lat: coordsMock.lat,
        lon: coordsMock.lon,
        apiKey: '',
      ),
    ).thenAnswer((_) => Future.value(weatherForLocation));
    final weatherRepository = WeatherRepositoryImpl(mockApiService);
    final response = await weatherRepository.getWeatherForPosition(
      coordsMock.lat,
      coordsMock.lon,
    );
    expect(response, weatherForLocation);
  });

  test('getWeatherForCity should return correct weather for city',
          () async {
        when(
          mockApiService.getWeatherForCityName(
            city: 'warsaw',
            apiKey: '',
          ),
        ).thenAnswer((_) => Future.value(weatherForCity));
        final weatherRepository = WeatherRepositoryImpl(mockApiService);
        final response = await weatherRepository.getWeatherForCityName('warsaw');
        expect(response, weatherForCity);
      });
}
