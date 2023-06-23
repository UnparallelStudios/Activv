import 'dart:async';

import 'package:activv/widgets/login_pg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Logo(),
  ));
}

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const FormPage()));
    });
  }

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

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
