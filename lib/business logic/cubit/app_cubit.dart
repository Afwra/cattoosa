import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cattoosa/cottoosa/data/models/animal_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
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



  //---------------------------------------------------------------------------------------

  final recorder = FlutterSoundRecorder();
  File? audioFile;

  Future initRecorder()async{
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      emit(RecordingFailState());
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
    emit(InitRecorderState());
  }

  void disposeRecorder(){
    recorder.closeRecorder();
  }

  Future record() async{
    await recorder.startRecorder(numChannels: 1,toFile: 'audio',sampleRate: 22050);
    recording = true;
    emit(RecordingSuccessState());

  }
  Future stop() async{
    final path =  await recorder.stopRecorder();
    emit(RecordingStopState());
    log(path.toString());
    audioFile = File(path!);
    log('audioFile contents = ${audioFile!.readAsBytes()}');
    recording = false;

  }

  bool recording = false;
  void startRecording()async{
    if(recorder.isRecording){
      await stop();
    } else{
      await record();
    }


  }



}
