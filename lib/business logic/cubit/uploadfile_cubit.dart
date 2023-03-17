import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cattoosa/Data/animalModel/animalsoundModel.dart';
import 'package:cattoosa/core/network%20services/remote/dio_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'uploadfile_state.dart';

class UploadfileCubit extends Cubit<UploadfileState> {
  UploadfileCubit() : super(UploadfileInitial());

  static UploadfileCubit get(context) => BlocProvider.of(context);
  AnimalSoundModel? animalSoundModel;
  void UploadAudioFile({
    required String? file,
  }) {
    emit(UploadAudofileLoading());
    DioHelper.postData(data: {
      'predicted_class': file,
    }, url: '')
        .then((value) {
      log(value.toString());
      // filemodle = filemodle.fromJson(value.data);
      log(value.data.toString());
      log(value.data['message'].toString());
      emit(UploadAudofileSuccess());
      log('3333333333333333333333333333333333333');
    }).catchError((e) {
      emit(UploadAudofileError(e.toString()));
      log(e.toString());
    });
  }
}
