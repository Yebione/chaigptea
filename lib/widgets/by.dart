import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class branding extends StatelessWidget {
  const branding({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('by MASHAKYJA SOLUTIONS',
        style: GoogleFonts.atkinsonHyperlegible(
          textStyle: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
        ));
  }
}
