import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static Widget appText({String? text, TextStyle? textStyle}) {
    return Text(
      text ?? "",
      style: GoogleFonts.nunito(textStyle: textStyle),
    );
  }
}
