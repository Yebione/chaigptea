import 'package:flutter/material.dart';
import 'package:reconstructed/datamodel.dart';
import 'package:reconstructed/widgets/bubble.dart';
import 'package:reconstructed/widgets/chatinput.dart';
import 'package:reconstructed/widgets/exitbutton.dart';
import 'package:reconstructed/widgets/homelogo.dart';
import 'bg.dart';

class ChatPage extends StatefulWidget {
  final String message;
  final DataModel? data;

  ChatPage({required this.message, required this.data});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double paddingValue;
    if (screenWidth > screenHeight) {
      paddingValue = screenWidth * 0.3;
    } else {
      paddingValue = screenWidth * 0.08;
    }

    return Scaffold(
        backgroundColor: Color(0xFF131314),
        body: Stack(children: [
          Background(),
          Padding(
            padding: EdgeInsets.only(
                right: paddingValue, left: paddingValue, top: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Logo(), ExitButton()],
                  ),
                  Bubble(message: widget.message, data: widget.data),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenWidth > screenHeight ? 20 : 0,
            left: screenWidth > screenHeight ? screenWidth * 0.29 : 0,
            right: screenWidth > screenHeight ? screenWidth * 0.29 : 0,
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
              height: screenHeight * 0.12,
              width:
                  screenWidth > screenHeight ? screenWidth * 0.4 : screenWidth,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.12),
                borderRadius: screenWidth < screenHeight
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
              ),
              child: Column(
                children: [
                  ChatInput(),
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'ChaigpTea can make mistakes. Consider checking info before brewing.',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 11),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
