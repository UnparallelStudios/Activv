import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(const MaterialApp(
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(
              fontFamily: 'Inter-Var',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 45,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    splashRadius: 0.1,
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                      size: 29,
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
                    splashRadius: 0.1,
                    icon: Image.asset(
                      'assets/3d_avatar_13.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ],
            )
          ],
          backgroundColor: const Color.fromRGBO(216, 216, 255, 1),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(6.0),
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
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 8.5, 10.0, 10.0),
                  color: const Color.fromRGBO(240, 240, 240, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 200, 152, 245),
                              shape: const StadiumBorder(),
                            ),
                            child: const Icon(
                              IconData(0xe105, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                              size: 17,
                            ),
                          ),
                          const Text(
                            'Label',
                            style: TextStyle(
                              color: Colors.black,
                              height: 0.7,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 200, 152, 245),
                                shape: const StadiumBorder()),
                            child: const Icon(
                              IconData(0xe105, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                              size: 17,
                            ),
                          ),
                          const Text(
                            'Label',
                            style: TextStyle(
                              color: Colors.black,
                              height: 0.7,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 200, 152, 245),
                                shape: const StadiumBorder()),
                            child: badges.Badge(
                              badgeContent: const SizedBox(
                                  child: Center(
                                child: Text('3',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white)),
                              )),
                              position: badges.BadgePosition.topEnd(),
                              child: const Icon(
                                IconData(0xe105, fontFamily: 'MaterialIcons'),
                                color: Colors.black,
                                size: 17,
                              ),
                            ),
                          ),
                          const Text(
                            'Label',
                            style: TextStyle(
                              color: Colors.black,
                              height: 0.7,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
