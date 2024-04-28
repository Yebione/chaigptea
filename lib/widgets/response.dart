import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ModelResponse extends StatefulWidget {
  const ModelResponse({super.key});

  @override
  State<ModelResponse> createState() => _ModelResponseState();
}

class _ModelResponseState extends State<ModelResponse> {
  @override
  Widget build(BuildContext context) {
    String modelOut =
        "Tea originated in Southwest China, where it was used as a medicinal drink. It was first consumed by people who chewed fresh leaves to get a stimulating effect. The practice of brewing tea became popular during the Han Dynasty (206 BC – 220 AD), with tea drinking considered a sophisticated practice in Chinese culture.";
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
        color:
            Color.fromRGBO(255, 255, 255, 0.12), // #2F2F2F80 with 50% opacity
        borderRadius: BorderRadius.circular(20), // border radius of 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.coffee,
            color: Colors.white,
            size: screenWidth / 13,
          ),
          SizedBox(
            width: screenWidth * 0.09,
          ),
          Expanded(
            child: Text(
              modelOut,
              style: GoogleFonts.martelSans(
                fontSize: screenWidth / 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
