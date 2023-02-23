import '../entities/animal.dart';
import '../entities/animal_info.dart';

abstract class BaseAnimalRepository{
  Future<Animal> getAnimalName();
  Future<AnimalInfo> getAnimalInfo(String animalName);
}