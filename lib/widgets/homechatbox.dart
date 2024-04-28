import 'package:chaigptea/chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBoxHome extends StatefulWidget {
  const ChatBoxHome({Key? key}) : super(key: key);

  @override
  _ChatBoxHomeState createState() => _ChatBoxHomeState();
}

class _ChatBoxHomeState extends State<ChatBoxHome> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.6, // 70% of screen width
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Expanded(
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white), // Set input text color to white
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your question...',
                      hintStyle: TextStyle(
                          color: Colors.white), // Set hint text color to white
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.28, // 30% of screen width
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFCDA256),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Chat',
                        style: GoogleFonts.martelSans(
                          textStyle: TextStyle(
                            fontSize: screenWidth / 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 2,
              )
            ],
          ),
          width: screenWidth * 0.90, // 100% of screen width
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ],
    );
  }
}
