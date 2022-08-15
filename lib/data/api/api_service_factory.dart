import 'package:injectable/injectable.dart';
import 'package:weather_app/data/api/api_service.dart';
import 'package:weather_app/data/api/dio_factory.dart';


@injectable
class ApiServiceFactory {
  ApiServiceFactory(this._dioFactory);

  final DioFactory _dioFactory;

  ApiService get() => ApiService(_dioFactory.get());
}
