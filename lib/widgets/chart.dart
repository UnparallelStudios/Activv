// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  // runApp(const MyApp());
}

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

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData("oceania", 300),
    GDPData("africa", 100),
  ];
  return chartData;
}

class SubjectCard extends StatelessWidget {
  final int absentNumber;
  final String subject;
  final int totalDays;

  const SubjectCard(
      {super.key,
      required this.subject,
      required this.absentNumber,
      required this.totalDays});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(
                  //   "Data Visualisation",
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  // ),
                  Text(
                    subject,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Absent Classes: $absentNumber',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Total Classes: $totalDays',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
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
                              Color.fromARGB(255, 253, 216, 111),
                            ],
                            series: <CircularSeries>[
                              DoughnutSeries<GDPData, String>(
                                  innerRadius: '60%',
                                  dataSource: getChartData(),
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
                              Color.fromARGB(255, 253, 216, 111),
                              Color.fromARGB(255, 143, 133, 255)
                            ],
                            series: <CircularSeries>[
                              DoughnutSeries<GDPData, String>(
                                  innerRadius: "60%",
                                  cornerStyle: CornerStyle.bothCurve,
                                  dataSource: getChartData(),
                                  xValueMapper: (GDPData data, _) =>
                                      data.continent,
                                  yValueMapper: (GDPData data, _) => data.gdp)
                            ],
                          ),
                        ),
                        const Column(
                          children: [
                            Text("total"),
                            Text(
                              "50%",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
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
    );
  }
}
