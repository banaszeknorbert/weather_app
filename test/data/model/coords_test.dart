import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/model/coords.dart';

import '../../mocks/model_mocks.dart';

void main() {
  test('toJson should return correct json', () {
    final json = coordsMock.toJson();
    expect(json['lat'], coordsMock.lat);
    expect(json['lon'], coordsMock.lon);
  });

  test('fromJson should return correct object', () {
    const latitude = 10.0;
    const longitude = 20.0;
    final json = {'lat': latitude, 'lon': longitude};
    final model = Coords.fromJson(json);
    expect(model.lat, latitude);
    expect(model.lon, longitude);
  });
}