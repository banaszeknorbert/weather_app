import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:weather_app/data/model/coords.dart';
import 'package:weather_app/data/repository/location/location_repository.dart';

@Singleton(as: LocationRepository)
class LocationRepositoryImpl extends LocationRepository {
  LocationRepositoryImpl(this._location);

  final Location _location;

  @override
  Future<Coords> getCurrentLocation() async {
    final locationData = await _location.getLocation();
    final coords = Coords(
        longitude: locationData.longitude!, latitude: locationData.latitude!);
    return coords;
  }
}
