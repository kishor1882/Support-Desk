import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> opendelete(int index) async {
  final String apiUrl =
      'http://localhost:3000/opendelete'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'id': index,
    }),
  );

  if (response.statusCode == 200) {
    print('Data uploaded successfully');
  } else {
    print('Failed to upload data. Status Code: ${response.statusCode}');
  }
}

Future<void> inprogressdelete(int index) async {
  final String apiUrl =
      'http://localhost:3000/inprogressdelete'; // replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'id': index,
    }),
  );

  if (response.statusCode == 200) {
    print('Data uploaded successfully');
  } else {
    print('Failed to upload data. Status Code: ${response.statusCode}');
  }
}
