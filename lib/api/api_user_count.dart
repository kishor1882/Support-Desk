import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../pages/login/user_id.dart';

Future<int> getUserTotalCount() async {
  final String apiUrl = 'http://localhost:3000/getUserTotalCount';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['total_count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getUserOpenCount() async {
  final String apiUrl = 'http://localhost:3000/getUserOpenCount';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getUserInprogressCount() async {
  final String apiUrl = 'http://localhost:3000/getUserInprogressCount';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getUserCompletedCount() async {
  final String apiUrl = 'http://localhost:3000/getUserCompletedCount';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getUserRejectedCount() async {
  final String apiUrl = 'http://localhost:3000/getUserRejectedCount';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': Globals.userId,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}
