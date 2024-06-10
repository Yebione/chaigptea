import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reconstructed/datamodel.dart';

class Bubble extends StatefulWidget {
  final String message;
  final DataModel? data;

  Bubble({required this.message, required this.data, Key? key})
      : super(key: key);

  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    String message = widget.message;
    DataModel? data = widget.data;
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
                Color.fromRGBO(47, 47, 47, 0.5), // #2F2F2F80 with 50% opacity
            borderRadius: BorderRadius.circular(20), // border radius of 20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Expanded(
                child: SizedBox(),
                flex: 5,
              ),
              Expanded(
                flex: 80,
                child: Text(
                  message,
                  style: GoogleFonts.martelSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(
                255, 255, 255, 0.12), // #2F2F2F80 with 50% opacity
            borderRadius: BorderRadius.circular(20), // border radius of 20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: Icon(
                  FontAwesomeIcons.coffee,
                  color: Colors.white,
                  size: 23,
                ),
              ),
              Expanded(
                child: SizedBox(),
                flex: 5,
              ),
              Expanded(
                flex: 80,
                child: TyperAnimatedTextKit(
                  text: ['${data?.message}'],
                  textStyle: GoogleFonts.martelSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  speed: Duration(milliseconds: 50),
                  isRepeatingAnimation: false,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
