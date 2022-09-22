import 'package:flutter/material.dart';
import 'colors.dart';

class Themings {
  static const TextStyle mainText = TextStyle(
    color: AppColors.black,
    fontFamily: 'CircularStd',
  );

  static final ThemeData mainTheme = ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: AppColors.whiteGrey,
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: mainText,
    ),
    textTheme: const TextTheme(
      bodyText1: mainText,
      bodyText2: mainText,
      labelMedium: mainText,
      caption: mainText,
      button: mainText,
      overline: mainText,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
  );
}