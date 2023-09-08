import 'dart:convert';

import 'package:activv/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:activv/utils/json_convert.dart';
import 'package:activv/models/subject_model.dart';

void main() => runApp(const MaterialApp(
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    ));

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Subject> _subjectList = [];
  final userBox = Hive.box('userbox');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future getAttendanceData() async {
    List<Subject> tempList = [];
    final response = await http.post(Uri.parse('https://activv.onrender.com/'),
        // uses data stored in Hive userbox to get the userid and password
        body: jsonEncode({
          "Userid": userBox.get("userid"),
          "Password": userBox.get("password"),
          "Year": "2025",
          "Sem": "S4",
          "Branch": "AID"
        }),
        headers: {'Content-Type': 'application/json'});
    Map<String, dynamic> responseData = jsonDecode(response.body);
    List<String> rawAbsentData =
        getRawAbsentData(responseData['Response']['leaves']);
    Map<String, dynamic> totalSubjectMap =
        responseData['Response']['Total_classes'];
    Map<String, dynamic> absentSubjectMap = countAllOccurrences(rawAbsentData);
    absentSubjectMap.forEach((key, value) {
      tempList.add(Subject(
          subCode: key, daysAbsent: value, totalDays: totalSubjectMap[key]));
    });
    _subjectList = tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: "Business"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(0, 0, 153, 1),
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0, 0),
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontFamily: 'Inter-Var',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 45,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: badges.Badge(
                    badgeContent: const SizedBox(
                        child: Center(
                      child: Text(
                        '22',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    )),
                    position: badges.BadgePosition.topEnd(
                      top: -5,
                      end: -5,
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Color.fromRGBO(0, 0, 153, 1),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      splashRadius: 0.1,
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 31,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    splashRadius: 0.1,
                    icon: Image.asset(
                      'assets/3d_avatar_13.png',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                )
              ],
            ),
          )
        ],
        backgroundColor: const Color.fromRGBO(216, 216, 255, 1),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15.0),
            child: Container(
              color: const Color.fromRGBO(167, 167, 212, 1),
              height: 3.0,
            )),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              color: const Color.fromRGBO(216, 216, 255, 1),
              child: FutureBuilder(
                future: getAttendanceData(),
                builder: (context, snapshot) {
                  // if it is done loading then show the attendance data
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: _subjectList.length,
                        itemBuilder: (context, index) {
                          return SubjectCard(
                            subject: _subjectList[index].subCode,
                            absentNumber: _subjectList[index].daysAbsent,
                            totalDays: _subjectList[index].totalDays,
                          );
                        });
                    // otherwise show the loading indicator
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
