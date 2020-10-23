import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  const CustomText({
    Key key,
    @required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.montserrat(
            fontSize: fontSize, fontWeight: fontWeight, color: fontColor));
  }
}
