import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/email_create.dart';

class new_page extends StatefulWidget {
  const new_page({super.key});

  @override
  State<new_page> createState() => _new_pageState();
}

class _new_pageState extends State<new_page> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: ListView(
        children: [
          Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo_wobg.png', height: 150, width: 150),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextFormField(
                    validator: (email) {
                      if (email!.isEmpty)
                        return "please enter Email";
                      else
                        (print(email));
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      prefixIcon: Icon(Icons.email, color: Colors.green),
                      labelText: ("Enter your Email"),
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    validator: (email) {
                      if (email!.isEmpty)
                        return "please enter otp";
                      else
                        (print(email));
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      prefixIcon: Icon(Icons.key, color: Colors.green),
                      labelText: ("otp"),
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          print("valid");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => create(),
                            ),
                          );
                        }
                      },
                      child: Text('Verify')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
