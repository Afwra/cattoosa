import 'package:cattoosa/cottoosa/domain/repositories/base_animal_repository.dart';
import '../entities/animal_info.dart';

class GetAnimalInfoUseCase{
  final BaseAnimalRepository baseAnimalRepository;

  GetAnimalInfoUseCase(this.baseAnimalRepository);

  Future<AnimalInfo> exec(String animalName)async {
    return await baseAnimalRepository.getAnimalInfo(animalName);
  }
}