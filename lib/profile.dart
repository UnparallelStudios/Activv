import 'package:activv/widgets/login_pg.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() => runApp(const MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    ));

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userbox = Hive.box('userbox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                color: const Color.fromARGB(255, 27, 27, 27),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 35.0,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userbox.get("userimage")),
                          radius: 60.0,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      userbox.get("username"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter-var',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 1.5,
                    ),
                    Text(
                      userbox.get("userid"),
                      style: const TextStyle(
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
                      onPressed: () {
                        userbox.delete("userid");
                        userbox.delete("password");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const FormPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 0, 153, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          minimumSize: const Size(200.0, 60.0)),
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
      ),
    );
  }
}
