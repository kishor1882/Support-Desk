import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'pages/add.dart';
import 'pages/login/loginScreen.dart';

import 'pages/attachment.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
