// import 'package:fl_chart/fl_chart.dart';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             Row(mainAxisSize: MainAxisSize.max, children: [
//               Expanded(child: SubjectCard(subject: "DV", absentNumber: 20))
//             ]),
//             Row(mainAxisSize: MainAxisSize.max, children: [
//               Expanded(child: SubjectCard(subject: "IS", absentNumber: 25))
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

List<GDPData> getChartData(int absent, int total) {
  double value = (absent / total) * 100;
  final List<GDPData> chartData = [
    GDPData("oceania", value.toInt()),
    GDPData("africa", 100 - value.toInt()),
  ];
  return chartData;
}

String attendancePercentage(int absent, int total) {
  double value = (absent / total) * 100;
  int finalValue = 100 - value.toInt();
  return finalValue.toString();
}

class SubjectCard extends StatelessWidget {
  final int absentNumber;
  final String subject;
  final String subName;
  final int totalDays;

  const SubjectCard(
      {super.key,
      required this.subject,
      required this.absentNumber,
      required this.subName,
      required this.totalDays});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          color: const Color.fromRGBO(37, 37, 37, 1),
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        subName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        subject,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'absent \nclasses:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '$absentNumber',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 26),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            const Text(
                              'total \nclasses:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '$totalDays',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 26),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: SfCircularChart(
                              palette: const [
                                Color.fromARGB(255, 102, 91, 222),
                              ],
                              series: <CircularSeries>[
                                DoughnutSeries<GDPData, String>(
                                    innerRadius: '67%',
                                    dataSource:
                                        getChartData(absentNumber, totalDays),
                                    xValueMapper: (GDPData data, _) =>
                                        data.continent,
                                    yValueMapper: (GDPData data, _) => data.gdp)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: SfCircularChart(
                              palette: const [
                                Color.fromARGB(255, 102, 91, 222),
                                Color.fromARGB(255, 253, 206, 76),
                              ],
                              series: <CircularSeries>[
                                DoughnutSeries<GDPData, String>(
                                    innerRadius: "67%",
                                    cornerStyle: CornerStyle.bothCurve,
                                    dataSource:
                                        getChartData(absentNumber, totalDays),
                                    xValueMapper: (GDPData data, _) =>
                                        data.continent,
                                    yValueMapper: (GDPData data, _) => data.gdp)
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const Text(
                                "total",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${attendancePercentage(absentNumber, totalDays)}%",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
