class ServerException implements Exception {
  final String message;
  final String? code;

  ServerException({required this.message, this.code});

  @override
  String toString() => 'ServerException: $message (code: $code)';
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}

class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException({required this.message, this.code});
}
