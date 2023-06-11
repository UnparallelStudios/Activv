import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(216, 216, 255, 1),
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(
              fontFamily: 'Barlow-Bold',
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
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
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                  color: const Color.fromRGBO(240, 240, 240, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 200, 152, 245)),
                        child: const Column(
                          children: [
                            Icon(
                              IconData(0xe105, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                              size: 17,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Label',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Column(
                            children: [
                              Icon(
                                IconData(0xe105, fontFamily: 'MaterialIcons'),
                                color: Colors.black,
                                size: 17,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Label',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Column(
                            children: [
                              Icon(
                                IconData(0xe105, fontFamily: 'MaterialIcons'),
                                color: Colors.black,
                                size: 17,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Label',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                    ],
                  )),
            )
          ],
        ));
  }
}
