import 'package:flutter/material.dart';

class ChatBoxMain extends StatefulWidget {
  const ChatBoxMain({required Key key}) : super(key: key);

  @override
  State<ChatBoxMain> createState() => _ChatBoxMainState();
}

class _ChatBoxMainState extends State<ChatBoxMain> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your message',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
