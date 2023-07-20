import 'package:activv/dashboard.dart';
import 'package:activv/profile.dart';
import 'package:activv/widgets/logo_pg.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('userbox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Logo(),
        '/dash': (context) => const Dashboard(),
        '/profile': (context) => const ProfilePage()
      },
    );
  }
}
