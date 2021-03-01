import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    final textTheme = _getTextTheme(Brightness.light);
    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      dividerTheme: _dividerTheme,
    );
  }

  static ThemeData dark() {
    final textTheme = _getTextTheme(Brightness.dark);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      dividerTheme: _dividerTheme,
    );
  }

  static final _primaryColor = Colors.yellow[300];
  static const _accentColor = Colors.blueGrey;

  static const _dividerTheme = DividerThemeData(
    space: 0.0,
    indent: 16.0,
  );

  static TextTheme _getTextTheme(Brightness brightness) {
    final themeData = ThemeData(brightness: brightness);
    return GoogleFonts.robotoTextTheme(
      themeData.textTheme,
    ).copyWith(
      headline1: GoogleFonts.roboto(),
      headline2: GoogleFonts.roboto(),
      headline3: GoogleFonts.roboto(),
      headline4: GoogleFonts.roboto(),
      headline5: GoogleFonts.roboto(),
      headline6: GoogleFonts.roboto(),
    );
  }
}
