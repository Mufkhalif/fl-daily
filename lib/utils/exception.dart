class ServerException implements Exception {
  final String message;
  ServerException({this.message = "Server Failure"});
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
