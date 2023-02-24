import 'package:cattoosa/cottoosa/domain/entities/animal_info.dart';

class AnimalInfoModel extends AnimalInfo {
  const AnimalInfoModel({
    required super.name,
    required super.kingdom,
    required super.animalClass,
    required super.family,
    required super.locations,
    required super.habitat,
    required super.populationSize,
    required super.mostDistinctiveFeature,
  });

  factory AnimalInfoModel.fromJson(Map<String, dynamic> json) {
    return AnimalInfoModel(
      name: json['name'],
      kingdom: json['taxonomy']['kingdom'],
      animalClass: json['taxonomy']['class'],
      family: json['taxonomy']['family'],
      locations: List<String>.from(json['locations'].map((e)=>e)),
      habitat: json['characteristics']['habitat'],
      populationSize: json['characteristics']['estimated_population_size'],
      mostDistinctiveFeature: json['characteristics']['most_distinctive_feature'],
    );
  }
}
