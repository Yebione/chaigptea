import 'package:flutter/material.dart';
import 'package:reconstructed/bg.dart';
import 'package:reconstructed/widgets/by.dart';
import 'package:reconstructed/widgets/homechat.dart';
import 'package:reconstructed/widgets/homelogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF131314),
      body: Stack(
        children: [
          Background(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Logo(),
                    SizedBox(height: screenHeight * 0.22),
                    HomeChatBox(),
                    SizedBox(height: screenHeight * 0.34),
                    branding(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
