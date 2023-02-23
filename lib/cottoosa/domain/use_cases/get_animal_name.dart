import 'package:cattoosa/cottoosa/domain/entities/animal.dart';
import 'package:cattoosa/cottoosa/domain/repositories/base_animal_repository.dart';

class GetAnimalNameUseCase{
  final BaseAnimalRepository baseAnimalRepository;

  GetAnimalNameUseCase(this.baseAnimalRepository);

  Future<Animal> exec() async{
    return await baseAnimalRepository.getAnimalName();
  }
}