import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cattoosa/core/network%20services/remote/dio_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'uploadfile_state.dart';

class UploadfileCubit extends Cubit<UploadfileState> {
  UploadfileCubit() : super(UploadfileInitial());

  static UploadfileCubit get(context) => BlocProvider.of(context);
  // filemodle? filemodle;
  void UploadAudioFile({
    required String? file,
  }) {
    emit(UploadAudofileLoading());
    DioHelper.postData(url: 'predict', data: {
      'predicted_class': file,
    }).then((value) {
      log(value.toString());
      // filemodle = filemodle.fromJson(value.data);
      log(value.data.toString());
      log(value.data['message'].toString());
      emit(UploadAudofileSuccess());
    }).catchError((e) {
      emit(UploadAudofileError(e.toString()));
      log(e.toString());
    });
  }
}
