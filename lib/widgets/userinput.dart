import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInputBubble extends StatefulWidget {
  const UserInputBubble({super.key});

  @override
  State<UserInputBubble> createState() => _UserInputBubbleState();
}

class _UserInputBubbleState extends State<UserInputBubble> {
  @override
  Widget build(BuildContext context) {
    String userInput = "What is the origin of tea?";
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
        color: Color.fromRGBO(47, 47, 47, 0.5), // #2F2F2F80 with 50% opacity
        borderRadius: BorderRadius.circular(20), // border radius of 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.person,
            color: Colors.white,
            size: screenWidth / 13,
          ),
          SizedBox(
            width: screenWidth * 0.07,
          ),
          Expanded(
            child: Text(
              userInput,
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
