import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
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
      ],
    );
  }
}
