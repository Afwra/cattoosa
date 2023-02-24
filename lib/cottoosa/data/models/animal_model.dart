import 'package:cattoosa/cottoosa/domain/entities/animal.dart';

class AnimalModel extends Animal {
  const AnimalModel({
    required super.name,
  });

  factory AnimalModel.fromJson(Map<String,dynamic> json){
    return AnimalModel(name: json['predicted_class']);
  }
}
