import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reconstructed/chat.dart';
import 'package:reconstructed/datamodel.dart';
import 'package:http/http.dart' as http;

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

Future<DataModel?> submitData(String message) async {
  var response = await http.post(
    Uri.parse('https://wv67b4xf-5000.asse.devtunnels.ms/api/chatbot'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "message": message,
    }),
  );

  var data = response.body;
  print(data);

  if (response.statusCode == 201) {
    String responseString = response.body;
    print(' $responseString ');
    return dataModelFromJson(responseString);
  } else {
    return null;
  }
}

class _ChatInputState extends State<ChatInput> {
  TextEditingController mesController = TextEditingController();
  DataModel? _dataModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 85,
            child: TextField(
              controller: mesController,
              textAlignVertical: TextAlignVertical.center,
              style: GoogleFonts.martelSans(color: Colors.white),
              cursorColor: Colors.white, // Set the cursor color to white
              decoration: InputDecoration(
                hintText: 'Enter your message',
                hintStyle: GoogleFonts.martelSans(
                    color: Colors.white.withOpacity(0.6)),
                border: InputBorder.none,
              ),
            )),
        Expanded(
          flex: 15,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return TextButton(
                onPressed: () async {
                  String message = mesController.text;

                  DataModel? data = await submitData(message);
                  if (data != null)
                    setState(() {
                      _dataModel = data;
                    });

                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          ChatPage(
                              message: mesController.text, data: _dataModel),
                      transitionDuration: Duration(seconds: 0),
                    ),
                    (route) => false,
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      Color(0xFFCDA256), // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: MediaQuery.of(context).size.width >
                        MediaQuery.of(context).size.height + 270
                    ? Text(
                        'Send Chat',
                        style: GoogleFonts.martelSans(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        Icons.send,
                        size: 20,
                        color: Colors.white,
                      ),
              );
            },
          ),
        )
      ],
    );
  }
}
