import 'package:weather_app/data/model/coords.dart';

abstract class LocationRepository {
  Future<Coords?> getCurrentLocation();
}
