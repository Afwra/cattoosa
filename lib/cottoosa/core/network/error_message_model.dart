import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final String message;

  const ErrorMessageModel({required this.message});

  @override
  List<Object?> get props => [message];
  
  factory ErrorMessageModel.fromJson(Map<String,dynamic> json){
    return ErrorMessageModel(message: json['error']);
  }
}