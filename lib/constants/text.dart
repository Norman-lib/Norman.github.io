import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwala/constants/colors.dart';

class AppTextStyle {
  static TextStyle mainStyle = GoogleFonts.nunito(fontSize: 16);
  static TextStyle mainStyleBig = GoogleFonts.nunito(fontSize: 18);

  static TextStyle mainStyleBold =
      GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainStyleBold1 =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle descriptionStyle = GoogleFonts.nunito(fontSize: 20);

  static TextStyle descriptionStyleBold =
      GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.bold);
  static TextStyle descriptionStyleBoldPhone =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle buttonStyle =
      GoogleFonts.electrolize(fontSize: 15, color: Colors.black);
  static TextStyle buttonStyleBold = GoogleFonts.electrolize(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle navBarTextStyle = GoogleFonts.nunito(
    fontSize: 20,
  );
  static TextStyle appBarStyle =
      GoogleFonts.electrolize(fontSize: 15, color: Colors.black);
  static TextStyle appBarStyleBold = GoogleFonts.electrolize(
      fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle footerStyle =
      GoogleFonts.electrolize(fontSize: 15, color: Colors.black);

  static TextStyle footerStyleBig = GoogleFonts.electrolize(
      fontSize: 19, color: AppColors.colorPalette['dark']);

  static TextStyle titleStyle = GoogleFonts.arimo(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: AppColors.colorPalette['dark']);

  static TextStyle titleStyle2 = GoogleFonts.arimo(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.colorPalette['dark'],
  );

  static TextStyle titleStyle3 = GoogleFonts.arimo(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: AppColors.colorPalette['dark'],
  );
}

class SecondViewStyles {
  static TextStyle title = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    fontSize: 50,
  );
  static TextStyle subtitle = GoogleFonts.lato(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Color.fromARGB(255, 50, 50, 50));
  static TextStyle icontitle = GoogleFonts.josefinSans(
      fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black);
  static TextStyle icontitlebig = GoogleFonts.josefinSans(
      fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black);
  static TextStyle iconsubtitle = GoogleFonts.lato(
    fontWeight: FontWeight.w300,
    fontSize: 17,
    color: Color.fromARGB(255, 53, 53, 53),
    height: 1.5,
  );
  static TextStyle iconsubtitlebig = GoogleFonts.lato(
    fontWeight: FontWeight.w300,
    fontSize: 19,
    color: Color.fromARGB(255, 53, 53, 53),
    height: 1.5,
  );
  static TextStyle lastText = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Color.fromARGB(255, 0, 0, 0),
    height: 1.5,
  );
}
