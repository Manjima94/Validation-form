// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class Validator extends StatefulWidget {
  const Validator({super.key});

  @override
  State<Validator> createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  final formkey = GlobalKey<FormState>();

  var name = TextEditingController();
  var email = TextEditingController();
  var mobile = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 100,
        title: Center(
            child: Text(
          'LOGIN HERE',
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                'images/va.jpg',
                width: 500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'VALIDATION FORM',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Name : ',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                              height: 40,
                              width: 250,
                              child: TextFormField(
                                controller: name,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'enter a valid name';
                                  }
                                  return null;
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Text(
                            'Email : ',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                              height: 40,
                              width: 250,
                              child: TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'enter a valid email';
                                  }
                                  if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)) {
                                    return 'contain atleast one number,@';
                                  }
                                  return null;
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Row(
                        children: [
                          Text(
                            'Mobile : ',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                              height: 40,
                              width: 240,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: mobile,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter valid number';
                                  }
                                  return null;
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Row(
                        children: [
                          Text(
                            'Password : ',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                              height: 40,
                              width: 230,
                              child: TextFormField(
                                controller: password,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'incorrect password';
                                  }
                                  return null;
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState?.validate() ?? false) {
                              print(name.text);
                              print(email.text);
                              print(mobile.text);
                              print(password.text);
                            }
                          },
                          child: Text('submit')),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
