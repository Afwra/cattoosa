import 'package:equatable/equatable.dart';

class Animal extends Equatable{
  final String name;

  const Animal({required this.name});

  @override
  List<Object?> get props => [name];
}