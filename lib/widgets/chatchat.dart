import 'package:flutter/material.dart';
import 'package:reconstructed/widgets/chatinput.dart';

class ChatpageChat extends StatefulWidget {
  const ChatpageChat({super.key});

  @override
  State<ChatpageChat> createState() => _ChatpageChatState();
}

class _ChatpageChatState extends State<ChatpageChat> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: screenWidth > screenHeight ? 20 : 0,
      left: screenWidth > screenHeight ? screenWidth * 0.29 : 0,
      right: screenWidth > screenHeight ? screenWidth * 0.29 : 0,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
        height: screenHeight * 0.12,
        width: screenWidth > screenHeight ? screenWidth * 0.4 : screenWidth,
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
              style:
                  TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
