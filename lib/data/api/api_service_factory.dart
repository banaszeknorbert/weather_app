import 'package:injectable/injectable.dart';

import 'api_service.dart';
import 'dio_factory.dart';

@injectable
class ApiServiceFactory {
  ApiServiceFactory(this._dioFactory);

  final DioFactory _dioFactory;

  ApiService get() => ApiService(_dioFactory.get());
}
