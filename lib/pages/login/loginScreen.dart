import 'package:flutter/material.dart';

import '../../api/api_upload.dart';
import '../../api/api_user_data.dart';
import '../admin/admin_ticket.dart';

import '../new.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../user/user_ticket.dart';
import 'user_id.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> loginData() async {
    final String apiUrl =
        'http://localhost:3000/login'; // replace with your API endpoint
    print('Entered Function');

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email.text,
        'password': password.text,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);

      String message = responseData['message'];
      String userType = responseData['type'];

      Globals.userId = responseData['userid'];

      print('Data uploaded successfully');
      print('Message: $message');
      print('User Type: $userType');

      // Use Navigator to navigate to different pages based on user type
      if (userType == 'a') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => adminticket()),
        );
      } else if (userType == 's') {
        // Replace 'new_page()' with the appropriate page for user type 's'
        Globals.designation = "Student";
        fetchStudentData();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => user_ticket()),
        );
      } else if (userType == 't') {
        // Replace 'new_page()' with the appropriate page for user type 's'
        Globals.designation = "Teacher";
        fetchStaffData();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => user_ticket()),
        );
      } else {
        print('Unknown user type: $userType');
        // Handle unknown user type or show an error message
      }
    } else {
      print('Failed to upload data. Status Code: ${response.statusCode}');
      // Handle login failure, show an error message, etc.
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: ListView(
        children: [
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Form(
                  key: formkey,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Image.asset(
                          '../assets/logo_wobg.png',
                          height: 150,
                          width: 150,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            controller: email,
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
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.green),
                              labelText: ("Enter your Email"),
                              labelStyle: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: TextFormField(
                            controller: password,
                            validator: (email) {
                              if (email!.isEmpty)
                                return "please enter password ";
                              else
                                return null;
                            },
                            obscureText: !isvisible,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              prefixIcon: Icon(Icons.key, color: Colors.green),
                              labelText: ("Password"),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                  onPressed: () {
                                    {
                                      print("valid");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => new_page(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text("Forget Password ?"))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: loginData,
                              child: Text("Login to account"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
