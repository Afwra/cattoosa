import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    titleLarge: headingStyle.copyWith(color: MyColors.unslectedIconColor),
  ),
  cardColor: MyColors.backgroundColor,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: MyColors.unslectedIconColor),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.grey,
  cardColor: Colors.grey.withOpacity(0.4),
  textTheme: TextTheme(
    titleLarge: headingStyle.copyWith(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
);
