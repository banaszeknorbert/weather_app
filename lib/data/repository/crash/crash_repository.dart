abstract class CrashRepository {
  Future<void> reportError(dynamic error, StackTrace stackTrace);
}