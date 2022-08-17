import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/repository/location/location_repository_impl.dart';

import '../../../mocks/model_mocks.dart';
import 'location_repository_test.mocks.dart';

@GenerateMocks([Location])
void main() {
  late MockLocation mockLocation;

  setUp(() {
    mockLocation = MockLocation();
  });

  test('getCurrentLocation should return location when permission is granted',
      () async {
    when(mockLocation.hasPermission()).thenAnswer(
      (_) => Future.value(PermissionStatus.granted),
    );
    when(mockLocation.getLocation())
        .thenAnswer((_) => Future.value(mockLocationData));
    final locationRepository = LocationRepositoryImpl(mockLocation);
    final response = await locationRepository.getCurrentLocation();
    expect(response, coordsMock);
  });

  test(
      'getCurrentLocation should return location when permission is grantedLimited',
      () async {
    when(mockLocation.hasPermission()).thenAnswer(
      (_) => Future.value(PermissionStatus.grantedLimited),
    );
    when(mockLocation.getLocation())
        .thenAnswer((_) => Future.value(mockLocationData));
    final locationRepository = LocationRepositoryImpl(mockLocation);
    final response = await locationRepository.getCurrentLocation();
    expect(response, coordsMock);
  });

  test(
      'getCurrentLocation should return location when permission is grantedLimited',
      () async {
    when(mockLocation.hasPermission()).thenAnswer(
      (_) => Future.value(PermissionStatus.grantedLimited),
    );
    when(mockLocation.getLocation())
        .thenAnswer((_) => Future.value(mockLocationData));
    final locationRepository = LocationRepositoryImpl(mockLocation);
    final response = await locationRepository.getCurrentLocation();
    expect(response, coordsMock);
  });

  test(
      'getCurrentLocation should ask about permissions when permission is denied and return location for PermissionStatus.granted permission',
      () async {
    when(mockLocation.hasPermission()).thenAnswer(
      (_) => Future.value(PermissionStatus.denied),
    );
    when(mockLocation.requestPermission()).thenAnswer(
      (_) => Future.value(PermissionStatus.granted),
    );
    when(mockLocation.getLocation())
        .thenAnswer((_) => Future.value(mockLocationData));
    final locationRepository = LocationRepositoryImpl(mockLocation);
    final response = await locationRepository.getCurrentLocation();
    verify(mockLocation.requestPermission());
    expect(response, coordsMock);
  });

  test(
      'getCurrentLocation should ask about permissions when permission is denied and return location for PermissionStatus.grantedLimited permission',
      () async {
    when(mockLocation.hasPermission()).thenAnswer(
      (_) => Future.value(PermissionStatus.denied),
    );
    when(mockLocation.requestPermission()).thenAnswer(
      (_) => Future.value(PermissionStatus.grantedLimited),
    );
    when(mockLocation.getLocation())
        .thenAnswer((_) => Future.value(mockLocationData));
    final locationRepository = LocationRepositoryImpl(mockLocation);
    final response = await locationRepository.getCurrentLocation();
    verify(mockLocation.requestPermission());
    expect(response, coordsMock);
  });
}
