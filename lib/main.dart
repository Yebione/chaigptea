import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChaigpTea',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(decoration: TextDecoration.none),
            bodyText2: TextStyle(decoration: TextDecoration.none),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionColor: Colors.white.withOpacity(0.4),
            selectionHandleColor: Colors.white.withOpacity(0.4),
          ),
        ),
        home: HomePage());
  }
}
