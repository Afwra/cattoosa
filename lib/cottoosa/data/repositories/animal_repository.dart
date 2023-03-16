// import 'package:cattoosa/core/error/exceptions.dart';
// import 'package:cattoosa/core/error/failures.dart';
// import 'package:cattoosa/cottoosa/data/data_sources/animal_remote_data_source.dart';
// import 'package:cattoosa/cottoosa/domain/entities/animal.dart';
// import 'package:cattoosa/cottoosa/domain/entities/animal_info.dart';
// import 'package:cattoosa/cottoosa/domain/repositories/base_animal_repository.dart';
// import 'package:dartz/dartz.dart';

// class AnimalRepository extends BaseAnimalRepository{

//   final BaseAnimalRemoteDataSource baseAnimalRemoteDataSource;


//   AnimalRepository(this.baseAnimalRemoteDataSource);

//   @override
//   Future<Either<Failure,AnimalInfo>> getAnimalInfo(String animalName) async{
//     final result = await baseAnimalRemoteDataSource.getAnimalInfo(animalName);
//     try{
//       return Right(result);
//     } on ServerException catch(failure){
//       return Left(ServerFailure(failure.errorMessageModel.message));
//     }
//   }

//   @override
//   Future<Either<Failure,Animal>> getAnimalName() async{

//     final result = await baseAnimalRemoteDataSource.getAnimalName();
//     try{
//       return Right(result);
//     } on ServerException catch(failure){
//       return Left(ServerFailure(failure.errorMessageModel.message));
//     }
//   }

// }