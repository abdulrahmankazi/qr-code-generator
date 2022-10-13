import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QRCodeTheme {
  static get primaryTheme {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      // useMaterial3: true,

      primaryColor: Colors.red,
    );
  }

  static get darkTheme {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      // useMaterial3: true,
      primaryColor: Colors.yellowAccent,
      // primarySwatch: Colors.purpleAccent,
    );
  }

  static final lightThemeData = ThemeData(
    primaryColor: Colors.yellowAccent,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.orangeAccent,
      toolbarTextStyle: TextStyle(
        fontStyle: FontStyle.italic,
      ),
    ),
    useMaterial3: true,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.orangeAccent,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.orangeAccent,
        onPrimary: Colors.white,
        padding: const EdgeInsets.all(16.0),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    ),
  );

  static final darkThemeData = ThemeData(
    primaryColor: Colors.redAccent,
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    ),
  );
}
