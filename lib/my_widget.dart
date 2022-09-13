import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.title, required this.msg});

  final String title;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [Text(title), Text(msg)],
        ),
      ),
    );
  }
}
