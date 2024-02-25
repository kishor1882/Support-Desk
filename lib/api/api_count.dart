import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<int> getTotalCount() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getTotalCount'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['total_count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getOpenCount() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getOpenCount'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getInprogressCount() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getInprogressCount'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getCompletedCount() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getCompletedCount'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<int> getRejectedCount() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getRejectedCount'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data[0]['count'];
  } else {
    throw Exception('Failed to load data');
  }
}
