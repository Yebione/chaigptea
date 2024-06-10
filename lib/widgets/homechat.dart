import 'package:flutter/material.dart';
import 'package:reconstructed/widgets/chatinput.dart';

class HomeChatBox extends StatefulWidget {
  const HomeChatBox({super.key});

  @override
  State<HomeChatBox> createState() => _HomeChatBoxState();
}

class _HomeChatBoxState extends State<HomeChatBox> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth;
    if (screenWidth > screenHeight) {
      containerWidth = screenWidth * 0.55;
    } else {
      containerWidth = screenWidth * 0.8;
    }

    double imageWidth;
    if (screenWidth > screenHeight) {
      imageWidth = screenWidth * 0.40;
    } else {
      imageWidth = screenWidth * 0.75;
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/images.png',
          width: imageWidth,
        ),
        Container(
            width: containerWidth,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,
            ),
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
              child: ChatInput(),
            )),
      ],
    );
  }
}
