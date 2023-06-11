import 'package:activv/widgets/login_pg.dart';
import 'package:flutter/material.dart';
// import 'package:activv/widgets/logo_pg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: FormPage(),
      ),
    );
  }
}
