import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cattoosa/Data/animal_image_model/animal_image_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import '../../Data/animal_info_model/animal_info_model.dart';
import '../../Data/animal_model/animal_model.dart';

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
  final player = AudioPlayer();
  bool loading = false;
  Future<void> _uploadAudio() async {
    loading = true;

    log('Upload Audio : ${_audioFile!.path.toString()}');
    if (_audioFile == null) return;
    emit(UploadAudioFileLoading());
    playAudio(_audioFile!.path.toString());
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
      log(animalModel!.predictedClass.toString());
      getAnimalImage(animalModel!.predictedClass.toString());
      loading = false;
      playAudio(_audioFile!.path.toString());
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

  AnimalImageModel? animalImageModel;
  bool imageLoading = false;
  String animalImageUrl = 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';
  void getAnimalImage(String name)async{
    if(name == 'Unkown') {
      animalImageUrl = 'https://cdn.pixabay.com/photo/2012/04/24/11/42/no-symbol-39525_960_720.png';
      return;
    }
    imageLoading = true;
    emit(GetImageLoadingState());
    final response = await Dio().get(
      'https://pixabay.com/api',
      queryParameters: {
        'key':'34613538-d7a6083f2da4cc5bc795858bb',
        'category':'animals',
        'safesearch':'true',
        'q': name,
        'editors_choice':'true'
      },
    );
    if(response.statusCode == 200){
      animalImageModel = AnimalImageModel.fromJson(response.data);
      animalImageUrl = animalImageModel!.hits?[0].largeImageURL??'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';
      log(animalImageModel!.total.toString());
      imageLoading = false;
      emit(GetImageSuccessState());
    }else{
      log(response.statusMessage.toString());
      emit(GetImageFailState());
    }
  }

  //---------------------------------------------------------------------------------------


  final _audioRecorder = Record();
  bool recording = false;
  Future initRecorder()async{
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      emit(RecordingFailState());
      throw 'Microphone permission not granted';
    }
    emit(InitRecorderState());
  }
  void recordAudio()async{
    if(await _audioRecorder.hasPermission()){
      final isSupported = await _audioRecorder.isEncoderSupported(
        AudioEncoder.wav,
      );
      if (kDebugMode) {
        print('${AudioEncoder.wav.name} supported: $isSupported');
      }

      if(recording == false){
        recording = true;
        await _audioRecorder.start(numChannels: 1,samplingRate: 22050,encoder: AudioEncoder.wav);
        emit(RecordingSuccessState());
      }else{
        final path = await _audioRecorder.stop();
        log('recording path = ${path.toString()}');
        _audioFile = File(path.toString());
        _uploadAudio();
        recording = false;
        emit(RecordingStopState());
      }

    }else{
      emit(RecordingFailState());
    }
  }

  void playAudio(String path)async{
    if(player.playing){
      player.stop();
      return;
    }else{
      await player.setFilePath(path);
      player.play();
    }
  }








  // RecorderController recorderController = RecorderController()..androidEncoder = AndroidEncoder.aac
  // ..androidOutputFormat = AndroidOutputFormat.ogg
  // ..sampleRate = 22050;
  // bool recording = false;
  //
  //
  //
  //
  // void startOrStopRecording()async{
  //   if(recording){
  //     recorderController.reset();
  //     final path = await recorderController.stop(false);
  //     if(path != null){
  //       log('rec path = ${path.toString()}');
  //       _audioFile = File(path);
  //       _uploadAudio();
  //     }
  //     recording = false;
  //     emit(RecordingStopState());
  //   }
  //   else{
  //     Directory appDirectory = await getApplicationDocumentsDirectory();
  //     String path = "${appDirectory.path}/recording.wav";
  //     recording = true;
  //     await recorderController.record(path: path);
  //     emit(RecordingSuccessState());
  //   }
  // }



  // FlutterSoundRecorder recorder = FlutterSoundRecorder();
  // File? audioFile;
  //
  // Future initRecorder()async{
  //   final status = await Permission.microphone.request();
  //   if(status != PermissionStatus.granted){
  //     emit(RecordingFailState());
  //     throw 'Microphone permission not granted';
  //   }
  //   await recorder.openRecorder();
  //   emit(InitRecorderState());
  // }
  //
  // void disposeRecorder(){
  //   recorder.closeRecorder();
  // }
  //
  // Future record() async{
  //   await recorder.startRecorder(toFile: 'audio',sampleRate: 22050,codec: Codec.defaultCodec);
  //   recorder.openRecorder();
  //   bool result  = await recorder.isEncoderSupported(Codec.pcm16WAV);
  //   log('is wav supported? ${result.toString()}');
  //   recording = true;
  //   emit(RecordingSuccessState());
  //
  // }
  // Future stop() async{
  //   final path =  await recorder.stopRecorder();
  //   emit(RecordingStopState());
  //   log(path.toString());
  //   _audioFile = File(path!);
  //   _uploadAudio();
  //   log('audioFile contents = ${audioFile!.readAsBytes()}');
  //   recording = false;
  //
  // }
  //
  // bool recording = false;
  // void startRecording()async{
  //   if(recorder.isRecording){
  //     await stop();
  //   } else{
  //     await record();
  //   }
  //
  //
  // }



}
