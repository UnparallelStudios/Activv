import 'dart:convert';

import 'package:activv/profile.dart';
import 'package:activv/widgets/chart.dart';
import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:activv/utils/json_convert.dart';
import 'package:activv/models/subject_model.dart';
import 'package:activv/utils/subcodes.dart';

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
  List<Widget> appPages = [
    const HomePage(),
    const ProfilePage(),
    const EventsPage()
  ];

  List<String> pageTitles = ["Dashboard", "Profile", "Events"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 33, 33, 33),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle,
                    color: Color.fromARGB(255, 120, 120, 120)),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.event,
                    color: Color.fromARGB(255, 120, 120, 120)),
                label: "Events")
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: (int index) => setState(() => _selectedIndex = index),
        ),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0, 0),
            child: Text(
              pageTitles[_selectedIndex],
              style: const TextStyle(
                fontFamily: 'Inter-Var',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0),
              child: Row(
                children: <Widget>[
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 45,
                  //   width: 45,
                  //   decoration: const ShapeDecoration(
                  //     color: Colors.white,
                  //     shape: CircleBorder(),
                  //   ),
                  //   child: badges.Badge(
                  //     badgeContent: const SizedBox(
                  //         child: Center(
                  //       child: Text(
                  //         '22',
                  //         style: TextStyle(
                  //           fontSize: 11,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     )),
                  //     position: badges.BadgePosition.topEnd(
                  //       top: -5,
                  //       end: -5,
                  //     ),
                  //     badgeStyle: const badges.BadgeStyle(
                  //       badgeColor: Color.fromRGBO(0, 0, 153, 1),
                  //     ),
                  //     child: IconButton(
                  //       onPressed: () {},
                  //       padding: EdgeInsets.zero,
                  //       splashRadius: 0.1,
                  //       icon: const Icon(
                  //         Icons.notifications_outlined,
                  //         color: Colors.black,
                  //         size: 31,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 45,
                  //   width: 45,
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (BuildContext context) =>
                  //                   const ProfilePage()));
                  //     },
                  //     padding: EdgeInsets.zero,
                  //     splashRadius: 0.1,
                  //     icon: Image.asset(
                  //       'assets/3d_avatar_13.png',
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 15.0,
                  )
                ],
              ),
            )
          ],
          backgroundColor: const Color.fromARGB(255, 27, 27, 27),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15.0),
            child: Container(
              color: const Color.fromARGB(255, 47, 47, 47),
              height: 3.0,
            ),
          ),
          elevation: 0,
        ),
        body: appPages.elementAt(_selectedIndex));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEmptyData = false;
  final userBox = Hive.box('userbox');

  @override
  void initState() {
    super.initState();
  }

  Future getAttendanceData() async {
    List<Subject> tempList = [];
    var currentDate = DateTime.now();
    var newFormat = '${currentDate.day}-${currentDate.month}';
    var atData = jsonDecode(userBox.get('atdata'));

    if (atData['fetch_date'] == newFormat) {
      List<String> rawAbsentData =
          getRawAbsentData(atData['Response']['leaves']);
      // print('rawabsent data is: $rawAbsentData');
      if (rawAbsentData.isEmpty) {
        isEmptyData = true;
      } else {
        isEmptyData = false;
      }
      Map<String, dynamic> totalSubjectMap =
          atData['Response']['Total_classes'];
      Map<String, dynamic> absentSubjectMap =
          countAllOccurrences(rawAbsentData);
      // print('absend subject map is: $absentSubjectMap');
      absentSubjectMap.forEach((key, value) {
        tempList.add(Subject(
            subCode: key,
            daysAbsent: value,
            totalDays: totalSubjectMap[key],
            subName: subCodes[key]));
      });
      return tempList;
    }
    final response = await http.post(Uri.parse('https://activv.onrender.com/'),
        // uses data stored in Hive userbox to get the userid and password
        body: jsonEncode({
          "Userid": userBox.get("userid"),
          "Password": userBox.get("password"),
          "Year": "2025",
          "Sem": "S5",
          "Branch": "AID"
        }),
        headers: {'Content-Type': 'application/json'});
    Map<String, dynamic> responseData = jsonDecode(response.body);
    // print('response data is $responseData');

    responseData['fetch_date'] = newFormat;
    userBox.put('atdata', jsonEncode(responseData));
    // print('response data $responseData');
    List<String> rawAbsentData =
        getRawAbsentData(responseData['Response']['leaves']);
    // print('rawabsent data is: $rawAbsentData');
    if (rawAbsentData.isEmpty) {
      isEmptyData = true;
    } else {
      isEmptyData = false;
    }
    Map<String, dynamic> totalSubjectMap =
        responseData['Response']['Total_classes'];
    Map<String, dynamic> absentSubjectMap = countAllOccurrences(rawAbsentData);
    // print('absend subject map is: $absentSubjectMap');
    absentSubjectMap.forEach((key, value) {
      tempList.add(Subject(
          subCode: key,
          daysAbsent: value,
          totalDays: totalSubjectMap[key],
          subName: subCodes[key]));
    });
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              color: const Color.fromARGB(255, 27, 27, 27),
              child: FutureBuilder(
                future: getAttendanceData(),
                builder: (context, snapshot) {
                  // if it is done loading then show the attendance data
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (isEmptyData) {
                      return Center(
                          child: Text(
                        "You were not absent in any subject",
                        style: TextStyle(color: Colors.grey[50]),
                      ));
                    } else {
                      // print('data is : $snapshot.data');
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return SubjectCard(
                              subject: snapshot.data[index].subCode,
                              absentNumber: snapshot.data[index].daysAbsent,
                              totalDays: snapshot.data[index].totalDays,
                              subName: snapshot.data[index].subName,
                            );
                          });
                    }

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

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 27, 27, 27),
            child: const Center(
              child: Text(
                "Events Page coming soon",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
