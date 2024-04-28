import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class logoChai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '🍵 ChaigpTea',
      style: GoogleFonts.atkinsonHyperlegible(
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
