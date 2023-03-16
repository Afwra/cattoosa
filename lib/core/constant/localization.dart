// // ignore_for_file: unused_local_variable

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:knife/core/constant/constants.dart';

// Future<Locale> setLocale(String languageCode) async {
//   prefs.setString('lang', languageCode);
//   return _locale(languageCode);
// }

// Locale _locale(String languageCode) {
//   Locale temp;
//   switch (languageCode) {
//     case 'ar':
//       temp = const Locale('ar', '');
//       break;
//     case 'en':
//       temp = const Locale('en', '');
//       break;
//     default:
//       temp = Locale(Platform.localeName.split('_')[0], '');
//   }
//   return temp;
// }

// Future<Locale> getLocale() async {
//   Locale temp;
//   String languageCode = prefs.getString('lang').toString();
//   return temp = _locale(languageCode);
// }
