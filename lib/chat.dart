import 'package:chaigptea/home.dart';
import 'package:chaigptea/widgets/exitbutton.dart';
import 'package:chaigptea/widgets/logo.dart';
import 'package:chaigptea/widgets/response.dart';
import 'package:chaigptea/widgets/userinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF131314),
      body: Stack(
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
          Container(
            height: screenHeight,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(25),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        logoChai(),
                        ExitButton(),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    UserInputBubble(),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    ModelResponse(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
              height: 120,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 34, 34, 1.0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your message',
                                  hintStyle: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.6), // 60% transparency
                                    fontWeight:
                                        FontWeight.w300, // Lessen font weight
                                    fontFamily: 'MartelSans',
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    205, 162, 86, 1.0), // #CDA256
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.send, color: Colors.white),
                                onPressed: () {
                                  // Handle the send button press
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'ChaigpTea can make mistakes. Consider checking important information.',
                          style: TextStyle(color: Colors.white, fontSize: 9.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
