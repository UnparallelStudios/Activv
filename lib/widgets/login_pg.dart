import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Great"),
                                  ),
                                );
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
