import 'package:equatable/equatable.dart';

class AnimalInfo extends Equatable {
  final String name;
  final String kingdom;
  final String animalClass;
  final String family;
  final List<String> locations;
  final String habitat;
  final int populationSize;
  final String mostDistinctiveFeature;

  const AnimalInfo({
    required this.name,
    required this.kingdom,
    required this.animalClass,
    required this.family,
    required this.locations,
    required this.habitat,
    required this.populationSize,
    required this.mostDistinctiveFeature,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,kingdom,animalClass,family,locations,habitat,populationSize,mostDistinctiveFeature];



}
