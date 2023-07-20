import 'package:activv/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
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
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: card,
                    ),
                    Container(
                      child: card,
                    ),
                    Container(
                      child: card,
                    ),
                    Container(
                      child: card,
                    )
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //       padding: const EdgeInsets.fromLTRB(10.0, 8.5, 10.0, 10.0),
            //       color: const Color.fromRGBO(240, 240, 240, 1),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Column(
            //             children: [
            //               TextButton(
            //                 onPressed: () {},
            //                 style: TextButton.styleFrom(
            //                   foregroundColor:
            //                       const Color.fromARGB(255, 200, 152, 245),
            //                   shape: const StadiumBorder(),
            //                 ),
            //                 child: const Icon(
            //                   IconData(0xe105, fontFamily: 'MaterialIcons'),
            //                   color: Colors.black,
            //                   size: 17,
            //                 ),
            //               ),
            //               const Text(
            //                 'Label',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   height: 0.7,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               TextButton(
            //                 onPressed: () {},
            //                 style: TextButton.styleFrom(
            //                     foregroundColor:
            //                         const Color.fromARGB(255, 200, 152, 245),
            //                     shape: const StadiumBorder()),
            //                 child: const Icon(
            //                   IconData(0xe105, fontFamily: 'MaterialIcons'),
            //                   color: Colors.black,
            //                   size: 17,
            //                 ),
            //               ),
            //               const Text(
            //                 'Label',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   height: 0.7,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               TextButton(
            //                 onPressed: () {},
            //                 style: TextButton.styleFrom(
            //                     foregroundColor:
            //                         const Color.fromARGB(255, 200, 152, 245),
            //                     shape: const StadiumBorder()),
            //                 child: badges.Badge(
            //                   badgeContent: const SizedBox(
            //                       child: Center(
            //                     child: Text('3',
            //                         style: TextStyle(
            //                             fontSize: 11, color: Colors.white)),
            //                   )),
            //                   position: badges.BadgePosition.topEnd(),
            //                   child: const Icon(
            //                     IconData(0xe105, fontFamily: 'MaterialIcons'),
            //                     color: Colors.black,
            //                     size: 17,
            //                   ),
            //                 ),
            //               ),
            //               const Text(
            //                 'Label',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   height: 0.7,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       )),
            // )
          ],
        ));
  }
}
