import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> getOpenData() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getOpenData'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Map<String, dynamic>>> getInprogressData() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getInprogressData'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Map<String, dynamic>>> getRejectedData() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getRejectedData'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Map<String, dynamic>>> getCompletedData() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/getCompletedData'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/fetchData'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
}
