import 'package:flutter/material.dart';

import 'package:chat_app/pages/chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(primaryColor: Colors.blue),
      home: ChatPage(),
    );
  }
}
