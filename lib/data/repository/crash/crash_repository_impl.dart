import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/data/repository/crash/crash_repository.dart';

@Singleton(as: CrashRepository)
class CrashRepositoryImpl extends CrashRepository {
  @override
  Future<void> reportError(dynamic error, StackTrace stackTrace) async {
    debugPrint('Error: $error\nStackTrace: $stackTrace');
  }
}
