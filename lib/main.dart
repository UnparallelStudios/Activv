import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 153),
        body: Center(
          child: Text(
            "ACTIVV",
            style: TextStyle(
              color: Colors.white,
              fontSize: 76,
              fontFamily: "Barlow-Bold",
              letterSpacing: 5
            ),
          ),
        ),
      ),
    );
  }
}
