import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorModel(
    this.statusCode,
    this.statusMessage,
    this.success,
  );

  factory ErrorModel.fromjson(Map<String, dynamic> json) => ErrorModel(
        json['status_code'],
        json['status_message'],
        json['success'],
      );
  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
