import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../pages/login/user_id.dart';

Future<void> uploadData(String user_id, String Button, String Raiser,
    String department, String designation, String description) async {
  final String apiUrl =
      'http://localhost:3000/upload'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': user_id,
      'button': Button,
      'raiser': Raiser,
      'department': department,
      'designation': designation,
      'description': description,
    }),
  );

  if (response.statusCode == 200) {
    print('Data uploaded successfully');
  } else {
    print('Failed to upload data. Status Code: ${response.statusCode}');
  }
}

Future<void> InprogressData(String user_id, String Button, String Raiser,
    String department, String designation, String description) async {
  final String apiUrl =
      'http://localhost:3000/Inprogressupload'; // replace with your API endpoint
  print("function");
  print(user_id);
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': user_id,
      'button': Button,
      'raiser': Raiser,
      'department': department,
      'designation': designation,
      'description': description,
    }),
  );

  if (response.statusCode == 200) {
    print('Data uploaded successfully');
  } else {
    print('Failed to upload data. Status Code: ${response.statusCode}');
  }
}

Future<void> RejectedData(String user_id, String Button, String Raiser,
    String department, String designation, String description) async {
  final String apiUrl =
      'http://localhost:3000/Rejectedupload'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': user_id,
      'button': Button,
      'raiser': Raiser,
      'department': department,
      'designation': designation,
      'description': description,
    }),
  );

  if (response.statusCode == 200) {
    print('Data uploaded successfully');
  } else {
    print('Failed to upload data. Status Code: ${response.statusCode}');
  }
}

Future<void> CompletedData(String user_id, String Button, String Raiser,
    String department, String designation, String description) async {
  final String apiUrl =
      'http://localhost:3000/Completedupload'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': user_id,
      'button': Button,
      'raiser': Raiser,
      'department': department,
      'designation': designation,
      'description': description,
    }),
  );

  if (response.statusCode == 200) {
    print('Data uploaded successfully');
  } else {
    print('Failed to upload data. Status Code: ${response.statusCode}');
  }
}
