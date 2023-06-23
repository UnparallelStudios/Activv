import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(const MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    ));

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0, 0),
            child: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Inter-Var',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                  child: Container(
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
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
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
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 35.0,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/3d_avatar_13.png'),
                            radius: 60.0,
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter-var',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 1.5,
                      ),
                      const Text(
                        'U21080XX',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Inter-var',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(0, 0, 153, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            minimumSize: const Size(200.0, 40.0)),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  )),
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
