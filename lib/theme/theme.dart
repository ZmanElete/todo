import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static IconData logo = Icons.access_alarm;

  static Color get iconGray => Color.fromARGB(255, 164, 164, 164);
  static Color get logoBlue => Color.fromARGB(255, 134, 189, 241);
  static Color get iconBlue => Color.fromARGB(255, 65, 154, 235);
  static Color get bgLightGray => Color.fromARGB(255, 76, 79, 83);
  static Color get fgDarkGray => Color.fromARGB(255, 36, 39, 40);
  static Color get darkBlue => Color.fromARGB(255, 60, 107, 223);
  static Color get lightRed => Color.fromARGB(255, 230, 65, 87);

  static TextTheme textTheme =  TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),//TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
      caption: TextStyle(color:  Colors.white),
      headline1: TextStyle(color:  Colors.white),
      subtitle2: TextStyle(color:  Colors.white),
      button: TextStyle(color: Colors.white),
      headline4: TextStyle(color: logoBlue, fontSize: 14),
      headline3: TextStyle(color: Colors.white),
      headline5: TextStyle(color: Colors.white),
      overline: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    );
  
  static ThemeData get theme => ThemeData(
    // brightness: Brightness.dark,
    dividerColor: Color.fromARGB(255, 198, 198, 198),
    primaryColor: Color.fromARGB(255, 57, 60, 65),
    accentColor: Colors.blue, 
    backgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    cardColor: Colors.blue,
    hintColor: Color.fromARGB(255, 114, 122, 135),
    scaffoldBackgroundColor: Color.fromARGB(255, 46, 46, 46),
    secondaryHeaderColor: Colors.white,
    primaryTextTheme: textTheme,
    textSelectionColor: Color.fromARGB(255, 46, 46, 46),
    textSelectionHandleColor: Color.fromARGB(255, 46, 46, 46),
    accentTextTheme: textTheme,

    inputDecorationTheme: InputDecorationTheme(
      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(0.0),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16.5),
    ),
    cursorColor: logoBlue,

    cardTheme: CardTheme(
      elevation: 10

    ),
    textTheme:textTheme,

  );

}