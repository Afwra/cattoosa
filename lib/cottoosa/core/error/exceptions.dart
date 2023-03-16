import '../network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}



class LocalDatabaseExceptions implements Exception{
  final String message;

  LocalDatabaseExceptions({required this.message});
}