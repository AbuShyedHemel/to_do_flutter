import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFFFF6347);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);

class Themes {
  static final light =
      ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Colors.white, brightness: Brightness.light);
  static final dark =
      ThemeData(
        backgroundColor: darkHeaderClr,
        primaryColor: darkHeaderClr, brightness: Brightness.dark);
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode? Colors.grey[400]: Colors.grey,
    )
  );
}
// ignore: non_constant_identifier_names
TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
    )
  );
}
TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode? Colors.white: Colors.black,
    )
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode? Colors.grey[100]: Colors.grey[600],
    )
  );
}
