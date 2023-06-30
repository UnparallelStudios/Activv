import 'dart:convert';
// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: MyAPP(),
  ));
}

class ServerData {
  final String data;
  final String status;

  const ServerData({required this.data, required this.status});

  factory ServerData.fromJson(Map<String, dynamic> json) {
    return ServerData(data: json['Response'], status: json['Status']);
  }
}

class MyAPP extends StatefulWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  _fetchData(BuildContext context) async {
    final response = await http.post(
        Uri.parse('https://activv.onrender.com/login'),
        body: jsonEncode({"Userid": "U2108037", "Password": "210567"}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      ServerData data = ServerData.fromJson(jsonDecode(response.body));
      if (data.status == "Success") {
        if (context.mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const NextPage()));
        }
      }
    } else {
      throw Exception("Could not connect to server");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  _fetchData(context);
                },
                child: const Text("Login")),
          ),
          // FutureBuilder(
          //     future: _studData,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return Text(snapshot.data!.data);
          //       } else if (snapshot.hasError) {
          //         return const Text("Error");
          //       }
          //       return const Text("Loading...........");
          //     })
        ],
      )),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: Text("Dashboard")),
    );
  }
}
