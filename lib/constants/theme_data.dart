import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData projectThemeData(){

  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      textTheme: textTheme(),
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity

  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: kTextColor),
          gapPadding: 10
      );
  return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 42,vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    errorStyle: const TextStyle(fontSize: 0,color: kTextColor)
    );
}

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor)
    );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Color(0XFF8B8B8B),fontSize: 18),
      centerTitle: true
      
    );
}