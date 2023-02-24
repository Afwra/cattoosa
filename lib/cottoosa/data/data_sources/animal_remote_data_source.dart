import 'package:cattoosa/core/network/api_constants.dart';
import 'package:cattoosa/cottoosa/data/models/animal_info_model.dart';
import 'package:cattoosa/cottoosa/data/models/animal_model.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';


abstract class BaseAnimalRemoteDataSource{
  Future<AnimalModel> getAnimalName();
  Future<AnimalInfoModel> getAnimalInfo(String name);
}

class AnimalRemoteDataSource extends BaseAnimalRemoteDataSource{
  @override
  Future<AnimalInfoModel> getAnimalInfo(String name) async{
    final response = await Dio().get(
        ApiConstants.baseAnimalInfoUrl,
      queryParameters: {'name':name},
      options: Options(
        headers: {
          'X-Api-Key': ApiConstants.apiKey
        }
      )
    );
    if(response.statusCode == 200){
      return AnimalInfoModel.fromJson(response.data[0]);   //need to iterate to the correct animal name
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<AnimalModel> getAnimalName() async{
    final response = await Dio().post(
        ApiConstants.baseAnimalUrl,
        data: {'file':'donkey.wav'}   //need to send the wav file
    );

    if(response.statusCode == 200){
      return AnimalModel(name: response.data['predicted_class']);
    }else{
      throw ServerException(errorMessageModel: const ErrorMessageModel(message: 'Unable to load Model'));
    }
  }

}