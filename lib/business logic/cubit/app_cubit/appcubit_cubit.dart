// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';


// part 'appcubit_state.dart';

// class AppCubit extends Cubit<AppStates> {
//   AppCubit() : super(AppcubitInitial());
//   static AppCubit get(context) => BlocProvider.of(context);
// //=======================================================================================================================================================
//   int currentIndex = 0;
//   List<Widget> screens = [
//     const HomeScreen(),
//     Planscreen(),
//     const NotificationsScreen(),
//     BasketScreen(),
//     ProfileScreen(),
//   ];
//   void changeBottom(int index) {
//     currentIndex = index;
//     emit((AppChangeBottomNavStates()));
//   }
//   //=======================================================================================================================================================

// // NotificationsScreen(),
// //     ProfileScreen(),
// //     HomeScreen(),
// //     FavouriteSceen(),
// //     ProfileScreen()
//   //=======================================================================================================================================================
//   bool isArabic = false;
//   bool isEnglish = false;
//   // void changeLanguage() {
//   //   if (prefs.getString("lang") != null) {
//   //     if (prefs.getString("lang") == "en") {
//   //       isEnglish = true;
//   //       isArabic = false;
//   //       emit(ChangeLanguageState());
//   //     } else {
//   //       isEnglish = false;
//   //       isArabic = true;
//   //       emit(ChangeLanguageState());
//   //     }
//   //   } else {
//   //     if (Platform.localeName.split('_')[0] == "en") {
//   //       isEnglish = true;
//   //       isArabic = false;
//   //       emit(ChangeLanguageState());
//   //     } else {
//   //       isEnglish = false;
//   //       isArabic = true;
//   //       emit(ChangeLanguageState());
//   //     }
//   //   }
//   // }
// }
