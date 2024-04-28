import 'package:chaigptea/widgets/homechatbox.dart';
import 'package:chaigptea/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:chaigptea/chat.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/hook.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false, // Add this line
        backgroundColor: Color(0xFF131314),
        body: Stack(children: [
          Positioned(
            top: (screenWidth - (screenWidth / 2)) * -1,
            left: (screenWidth - (screenWidth / 2)) * -1,
            child: Container(
              width: screenWidth + 100,
              height: screenWidth + 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.4083,
                  colors: [
                    Color.fromRGBO(215, 190, 133, 0.16),
                    Color.fromRGBO(21, 22, 24, 0.2),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: (screenWidth - (screenWidth / 2)) * -1,
            right: (screenWidth - (screenWidth / 2)) * -1,
            child: Container(
              width: screenWidth + 100,
              height: screenWidth + 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.4083,
                  colors: [
                    Color.fromRGBO(66, 190, 119, 0.16),
                    Color.fromRGBO(21, 22, 24, 0.2),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoChai(),
                  SizedBox(
                    height: screenHeight * .2,
                  ),
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ChatBoxHome(),
                        TeaQuery(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .28,
                  ),
                  Text(
                    'by MASHAKYJA SOLUTIONS',
                    style: GoogleFonts.atkinsonHyperlegible(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
