import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor primaryColor = Colors.indigo;
  static const String headlineText = "Calculate Average";
  static final TextStyle headlineStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: primaryColor);
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle showAverageBodyStyle = GoogleFonts.quicksand(
      fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor,);
  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: primaryColor);

  static final dropDownPadding = EdgeInsets.all(5);
}
