// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:x_fitness/Data/auth/login_model.dart';
// import 'package:x_fitness/core/network%20services/remote/dio_helper.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());
//   static AuthCubit get(context) => BlocProvider.of(context);

//   LoginModel? loginModel;
//   void userLogin({
//     String? email,
//     String? phone,
//     required String password,
//   }) {
//     emit(AuthLoginCubitLoading());
//     DioHelper.postData(url: '', data: {
//       'email': email,
//       'password': password,
//     }).then((value) {
//       log(value.toString());
//       loginModel = LoginModel.fromJson(value.data);
//       log(value.data.toString());
//       log(value.data['message'].toString());
//       emit(AuthLoginCubitSuccess(loginModel));
//     }).catchError((e) {
//       emit(AuthLoginCubitError(e.toString()));
//       log(e.toString());
//     });
//   }
// }
