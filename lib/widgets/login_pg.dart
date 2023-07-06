import 'package:activv/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final _formKey = GlobalKey<FormState>();

class LoginData {
  final String status;
  final String message;

  LoginData(this.message, this.status);

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(json['Response'], json['Status']);
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String userid = "";
  String password = "";
  String loginStatus = "n";

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      userid = _usernameController.text;
    });
    _passwordController.addListener(() {
      password = _passwordController.text;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _fetchLoginDetails(
      BuildContext context, String username, String password) async {
    final response = await http.post(
        Uri.parse('https://activv.onrender.com/login'),
        body: jsonEncode({"Userid": username, "Password": password}),
        headers: {'Content-Type': 'application/json'});
    LoginData details = LoginData.fromJson(jsonDecode(response.body));
    if (context.mounted) {
      if (details.status == "Success") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const Dashboard()));
      } else {
        setState(() {
          loginStatus = "e";
        });
        _usernameController.clear();
        _passwordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "login failed",
          style: TextStyle(color: Colors.red),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "WELCOME TO",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text("ACTIVV",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: const Column(children: [
                  Text("Get your college data wherever you are"),
                  Text("whenever you want"),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: _usernameController,
                        onChanged: (value) {
                          userid = value;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter UID"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter something";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 48),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter something";
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: loginStatus == "l" ? false : true,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // alignment: const Alignment(0, 0),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 0, 153),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80))),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loginStatus = "l";
                                  });
                                  _fetchLoginDetails(context, userid, password);
                                }
                              },
                              child: const Text(
                                "CONTINUE",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              Visibility(
                  visible: loginStatus == "l" ? true : false,
                  child: const SpinKitCircle(
                    color: Colors.blue,
                    size: 100.0,
                  ))
            ]),
      ),
    );
  }
}
