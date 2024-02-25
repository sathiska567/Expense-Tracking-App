import 'package:expence_tracking_app/expenses.dart';
import "package:flutter/material.dart";

var kColorSchema = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(
        255, 96, 59, 181)); //in here use to k to identify global variable

var kDarkColorSchema = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99 , 125)
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorSchema,

      elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorSchema.primaryContainer,
          foregroundColor: kDarkColorSchema.onPrimaryContainer,
          
        )),

        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: kDarkColorSchema.secondaryContainer,
        ),
    ),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchema,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorSchema.onPrimaryContainer,
          foregroundColor: kColorSchema.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          // color: kDarkColorSchema.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorSchema.primaryContainer,
          foregroundColor: kColorSchema.onPrimaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kColorSchema.onSecondaryContainer))),
    home: const Expenses(),
  ));
}
