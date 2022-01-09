import 'package:chairs_factory/utils/constants/values.dart';
import 'package:chairs_factory/utils/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  TextStyle get textStyle1 => GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColor.txtColor1,
          fontFamily: fontFamily2,
          fontSize: 20,
        ),
      );

  TextStyle get textStyle2 => GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColor.txtColor2,
          fontFamily: fontFamily1,
          fontSize: 20,
        ),
      );
  TextStyle get textStyle3 => GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColor.txtColor3,
          fontFamily: fontFamily2,
          fontSize: 20,
        ),
      );
  TextStyle get textStyle4 => GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColor.txtColor4,
          fontFamily: fontFamily2,
          fontSize: 20,
        ),
      );

  TextStyle get textStyle5 => GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColor.txtColor5,
          fontFamily: fontFamily2,
          fontSize: 20,
        ),
      );
}
