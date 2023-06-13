import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: chart,
      ),
    );
  }
}

Widget chart = Container(
  padding: const EdgeInsets.all(8),
  child: PieChart(PieChartData(sections: [
    PieChartSectionData(
      value: 10,
      color: const Color.fromARGB(255, 253, 216, 111),
      radius: 60,
    ),
    PieChartSectionData(
        value: 90,
        color: const Color.fromARGB(253, 145, 133, 255),
        radius: 50,
        showTitle: false)
  ], startDegreeOffset: 180)),
);
