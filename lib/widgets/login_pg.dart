import 'package:activv/dashboard.dart';
import 'package:flutter/material.dart';
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
    }
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
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
                      controller: usernameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Enter UID"),
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
                      controller: passwordController,
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
                                _fetchLoginDetails(
                                    context,
                                    usernameController.text,
                                    passwordController.text);
                              }
                            },
                            child: const Text(
                              "CONTINUE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            )),
                      )
                    ],
                  ),
                ]),
              ),
            )
          ]),
    );
  }
}
