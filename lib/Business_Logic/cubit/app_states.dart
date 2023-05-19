part of 'app_cubit.dart';

abstract class AppStates extends Equatable {
  const AppStates();

  @override
  List<Object> get props => [];
}

class UploadFileInitial extends AppStates {}

// When the user is uploading the file
class UploadAudioFileLoading extends AppStates {}

// When the user uploaded the file successfully
class UploadAudioFileSuccess extends AppStates {}

// When the user failed to upload the file
class UploadAudioFileError extends AppStates {
  final String error;

  const UploadAudioFileError(this.error);

  @override
  List<Object> get props => [error];
}

class AppHomeState extends AppStates{}


class GetInfoLoadingState extends AppStates{}
class GetInfoSuccessState extends AppStates{}
class GetInfoFailState extends AppStates{}

class GetImageLoadingState extends AppStates{}
class GetImageSuccessState extends AppStates{}
class GetImageFailState extends AppStates{}

class InternetState extends AppStates{}
class NoInternetState extends AppStates{}


class InitRecorderState extends AppStates{}
class RecordingSuccessState extends AppStates{}
class RecordingStopState extends AppStates{}

class RecordingFailState extends AppStates{}
