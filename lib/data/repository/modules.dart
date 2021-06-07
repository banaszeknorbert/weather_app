import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@module
abstract class Modules {
  @lazySingleton
  Location get location => Location();
}
