// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final Color color;
  final FontWeight? fintWeight;
  final double size;
  const TextWidget({
    Key? key,
    required this.txt,
    required this.color,
    this.fintWeight,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.almarai(
        textStyle: TextStyle(
          color: color,
          letterSpacing: .5,
          fontWeight: fintWeight ?? FontWeight.bold,
          fontSize: size,
        ),
      ),
    );
  }
}
