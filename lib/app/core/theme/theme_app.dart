import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp(this.context);

  final BuildContext context;

  get theme => ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.indigo,
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.white,
        accentColorBrightness: Brightness.light,
        primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        cursorColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          //   borderSide: BorderSide(
          //     color: Colors.white,
          //   ),
          // ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
