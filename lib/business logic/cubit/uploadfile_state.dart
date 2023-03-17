part of 'uploadfile_cubit.dart';

abstract class UploadfileState extends Equatable {
  const UploadfileState();

  @override
  List<Object> get props => [];
}

class UploadfileInitial extends UploadfileState {}

// When the user is uploading the file
class UploadAudofileLoading extends UploadfileState {}

// When the user uploaded the file successfully
class UploadAudofileSuccess extends UploadfileState {}

// When the user failed to upload the file
class UploadAudofileError extends UploadfileState {
  final String error;

  UploadAudofileError(this.error);

  @override
  List<Object> get props => [error];
}
