import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../pages/login/user_id.dart';

Future<List<Map<String, dynamic>>> getUserOpenData() async {
  final String apiUrl =
      'http://localhost:3000/getUserOpenData'; // replace with your API endpoint
  print(Globals.userId);
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Map<String, dynamic>>> getUserInprogressData() async {
  final String apiUrl =
      'http://localhost:3000/getUserInprogressData'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Map<String, dynamic>>> getUserRejectedData() async {
  final String apiUrl =
      'http://localhost:3000/getUserRejectedData'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Map<String, dynamic>>> getUserCompletedData() async {
  final String apiUrl =
      'http://localhost:3000/getUserCompletedData'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<void> fetchStudentData() async {
  final String apiUrl =
      'http://localhost:3000/fetchStudentData'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = json.decode(response.body);
    Globals.raiser = responseData['raiser'];
    Globals.department = responseData['department'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<void> fetchStaffData() async {
  final String apiUrl =
      'http://localhost:3000/fetchStaffData'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = json.decode(response.body);
    Globals.raiser = responseData['raiser'];
    Globals.department = responseData['department'];
  } else {
    throw Exception('Failed to load data');
  }
}
