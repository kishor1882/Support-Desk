import 'package:flutter/material.dart';

import '../admin/admin_ticket.dart';

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final newpwd = TextEditingController();
  final conpwd = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  bool isvisible = false;
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
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    validator: (email) {
                      if (email!.isEmpty)
                        return "Enter new password";
                      else
                        (print(email));
                      return null;
                    },
                    controller: newpwd,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      prefixIcon: Icon(Icons.email, color: Colors.green),
                      labelText: ("New password"),
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextFormField(
                    validator: (email) {
                      if (email!.isEmpty)
                        return " Enter correct password";
                      else
                        (print(email));
                      return null;
                    },
                    controller: conpwd,
                    obscureText: !isvisible,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      prefixIcon: Icon(Icons.email, color: Colors.green),
                      labelText: ("Confirm password"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                        },
                        icon: Icon(isvisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          print("valid");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => adminticket(),
                            ),
                          );
                        }
                      },
                      child: Text('Login')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
