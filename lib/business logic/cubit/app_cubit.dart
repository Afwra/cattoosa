import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cattoosa/cottoosa/data/models/animal_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import '../../Data/animal_info_model/animal_info_model.dart';

part 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(UploadFileInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  File? _audioFile;
  void getAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav'],
    );
    if (result != null) {
      _audioFile = File(result.files.single.path.toString());
      _uploadAudio();
    }
  }

  AnimalModel? animalModel;
  bool loading = false;
  Future<void> _uploadAudio() async {
    if (_audioFile == null) return;
    emit(UploadAudioFileLoading());
    loading = true;
    final url =
        Uri.parse('https://flask-production-5c83.up.railway.app/predict');
    final request = http.MultipartRequest('POST', url);

    final audioBytes = await _audioFile!.readAsBytes();
    final audioStream = http.ByteStream.fromBytes(audioBytes);
    final audioLength = audioBytes.length;

    request.files.add(http.MultipartFile(
      'file',
      audioStream,
      audioLength,
      filename: basename(_audioFile!.path),
      contentType: MediaType('audio', 'wav'),
    ));

    final response = await http.Response.fromStream(await request.send());
    String resultText;
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      resultText = data['predicted_class'];
      animalModel = AnimalModel.fromJson(data);
      log(animalModel!.name);
      loading = false;
      emit(UploadAudioFileSuccess());
    } else {
      resultText = 'Error: ${response.statusCode}';
      emit(UploadAudioFileError(response.reasonPhrase.toString()));
    }
    log(resultText);
  }

  AnimalInfo? animalInfo;
  bool infoLoading = false;
  void getAnimalInfo({required String name}) async {

    infoLoading = true;
    emit(GetInfoLoadingState());
    final response = await Dio().get(
      'https://api.api-ninjas.com/v1/animals',
      options: Options(
        headers: {'X-Api-Key' : 'O03MggBaZTKxhEJ5VPGtwA==c17hnNJxvV2Yk1G3'},
      ),
      queryParameters: {'name': name},
    );
      if(response.statusCode == 200){
        animalInfo = AnimalInfo.fromJson(response.data[0]);
        log(animalInfo!.name.toString());
        infoLoading = false;
        emit(GetInfoSuccessState());
      }else{
        log(response.statusMessage.toString());
        emit(GetInfoFailState());
      }
  }

  // void uploadAudioFile() async {
  //   emit(UploadAudofileLoading());
  //   List<int> audioBytes = await _audioFile!.readAsBytes();
  //   FormData formData = FormData.fromMap({
  //     'audio': MultipartFile.fromBytes(
  //       audioBytes,
  //       filename: _audioFile!.path.split('/').last,
  //     ),
  //   });
  //
  //   final response = await Dio().post(
  //       'https://flask-production-5c83.up.railway.app/predict',
  //       data: formData  //need to send the wav file
  //   );
  //   if(response.statusCode == 200){
  //     log(response.data.toString());
  //     log(response.data['message'].toString());
  //     emit(UploadAudofileSuccess());
  //   }else{
  //     emit(UploadAudofileError(response.statusMessage.toString()));
  //     log(response.statusMessage.toString());
  //   }
  //
  //
  // }
}
