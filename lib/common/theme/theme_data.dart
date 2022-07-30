import 'package:flutter/material.dart';
import 'package:oro/common/theme/color_schema.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,
  colorScheme: lightColorScheme,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 57,
      height: 1.12,
      letterSpacing: 0,
      color: lightColorScheme.onBackground,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 45,
      height: 1.16,
      letterSpacing: 0,
      color: lightColorScheme.onBackground,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 36,
      height: 1.22,
      letterSpacing: 0,
      color: lightColorScheme.onBackground,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 32,
      height: 1.25,
      letterSpacing: 0,
      color: lightColorScheme.onBackground,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
      height: 1.29,
      letterSpacing: 0,
      color: lightColorScheme.onBackground,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 1.33,
      letterSpacing: 0,
      color: lightColorScheme.onBackground,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22,
      height: 1.27,
      letterSpacing: 0,
      color: lightColorScheme.onBackground,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
      color: lightColorScheme.onBackground,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
      color: lightColorScheme.onBackground,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
      color: lightColorScheme.onBackground,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.5,
      color: lightColorScheme.onBackground,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
      color: lightColorScheme.onBackground,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
      color: lightColorScheme.onBackground,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.25,
      color: lightColorScheme.onBackground,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.4,
      color: lightColorScheme.onBackground,
    ),
  ),
  fontFamily: 'NunitoSans',
  disabledColor: const Color.fromARGB(30, 31, 31, 31),
  primaryColor: lightColorScheme.primary,
  cardTheme: CardTheme(
    color: lightColorScheme.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(03),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(10),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: 'NunitoSans',
        ),
      ),
      backgroundColor: MaterialStateProperty.all(lightColorScheme.primary),
      foregroundColor:
          MaterialStateProperty.all(lightColorScheme.onPrimaryContainer),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: 'NunitoSans',
        ),
      ),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFFFC351)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      minimumSize: MaterialStateProperty.all(
        const Size(90, 40),
      ),
    ),
  ),
  dialogTheme: DialogTheme(
    // backgroundColor: lightColorScheme.primaryContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: lightColorScheme.onPrimary,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: lightColorScheme.onPrimary,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: lightColorScheme.onPrimary,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    ),
    labelStyle: TextStyle(
      color: lightColorScheme.onPrimary,
    ),
    iconColor: lightColorScheme.onPrimary,
  ),
);
