import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenTheme {
  var theme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: Constants().appColor,
      elevation: 0,
      titleTextStyle:
          const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
    ),
  );
}

class Constants {
  var appColor = const Color.fromARGB(255, 75, 167, 121);
  var backColor = const Color.fromARGB(255, 224, 223, 217);
}
