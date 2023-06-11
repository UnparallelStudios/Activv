import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

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
                letterSpacing: 6),
          ),
        ),
      ),
    );
  }
}
