import 'package:movies_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  ErrorModel errorModel;
  ServerException({
    required this.errorModel,
  });
}

class LocalDataBaseException implements Exception {
  final String message;
  LocalDataBaseException({
    required this.message,
  });
}
