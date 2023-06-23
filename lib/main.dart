import 'package:activv/dashboard.dart';
import 'package:activv/widgets/logo_pg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Logo(),
        '/dash': (context) => const Dashboard()
      },
    );
  }
}
