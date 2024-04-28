import 'package:chaigptea/widgets/homechatbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeaQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Need a cup of',
              style: GoogleFonts.martelSans(
                textStyle: TextStyle(
                  fontSize: screenWidth / 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'tea?',
                    style: GoogleFonts.martelSans(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/image.png',
                    width: screenWidth / 4,
                    height: screenWidth / 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
