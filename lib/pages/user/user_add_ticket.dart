import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../api/api_upload.dart';
import '../login/user_id.dart';

class user_add_ticket extends StatefulWidget {
  const user_add_ticket({super.key});

  @override
  State<user_add_ticket> createState() => _user_add_ticketState();
}

class _user_add_ticketState extends State<user_add_ticket> {
  @override
  String UserId = Globals.userId;
  String Button = '';
  String Raiser = Globals.raiser;
  String department = Globals.department;
  String designation = Globals.designation;
  final TextEditingController description = TextEditingController();

  int selectedButtonIndex = -1;

  void selectButton(int index) {
    setState(() {
      selectedButtonIndex = index;
      print(Globals.userId);
    });
  }

  Widget buildButton(int index, String buttonText) {
    return ElevatedButton(
      onPressed: () {
        selectButton(index);
        Button = buttonText;
      },
      style: ElevatedButton.styleFrom(
        primary: selectedButtonIndex == index ? Colors.blue : null,
      ),
      child: Text(buttonText),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Title')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          padding: EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ticket Category'),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    buildButton(0, 'Student affairs'),
                    buildButton(1, 'faculty affairs'),
                    buildButton(2, 'department'),
                    buildButton(3, 'teaching/learning'),
                    buildButton(4, 'office'),
                    buildButton(5, 'library'),
                    buildButton(6, 'canteen'),
                    buildButton(7, 'Hostel'),
                    buildButton(8, 'mentoring'),
                    buildButton(9, 'personal'),
                    buildButton(10, 'transport'),
                    buildButton(11, 'it operations'),
                    buildButton(12, 'restroom'),
                    buildButton(13, 'general'),
                  ],
                ),
                Text('Ticket Description'),
                Container(
                    height: 91,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: description,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Ticket Description',
                        ),
                      ),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Add Attachment'), Icon(Icons.attachment)]),
                ElevatedButton(
                    onPressed: () async {
                      await uploadData(UserId, Button, Raiser, department,
                          designation, description.text);
                    },
                    child: Text('Submit'))
              ]),
        ),
      ),
    );
  }
}
