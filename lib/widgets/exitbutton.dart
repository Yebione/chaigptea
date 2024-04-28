import 'package:chaigptea/home.dart';
import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32, // specify the width
      height: 32, // specify the height
      decoration: BoxDecoration(
        color: Color(0xFF161616),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.all(0), // remove padding
        icon: Icon(Icons.close,
            color: Colors.white, size: 20), // specify the icon size
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()), // navigate to home page
          );
        },
      ),
    );
  }
}
