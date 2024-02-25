import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class att extends StatefulWidget {
  const att({super.key});

  @override
  State<att> createState() => _attState();
}

class _attState extends State<att> {
  FilePickerResult? result;
  String fileContent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File Picker')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Pick File"),
              onPressed: () async {
                result = await FilePicker.platform.pickFiles(
                    type: FileType.custom, allowedExtensions: ['jpg', 'pdf']);
                print('File picked');
              },
            ),
            ElevatedButton(
              child: Text("Read File Content"),
              onPressed: () async {
                if (result != null && result!.files.isNotEmpty) {
                  print('Reading file content');
                  fileContent = await readFileContent(result!.files[0]);
                  setState(() {});
                } else {
                  print('No file selected');
                }
              },
            ),
            if (fileContent.isNotEmpty) const SizedBox(height: 20),
            if (fileContent.isNotEmpty)
              Text(
                'File Content:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            if (fileContent.isNotEmpty) const SizedBox(height: 10),
            if (fileContent.isNotEmpty)
              Text(
                fileContent,
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

Future<String> readFileContent(PlatformFile file) async {
  try {
    if (file.path != null) {
      // For non-web platforms, read content using the path property
      String content = await File(file.path!).readAsString();
      return content;
    } else if (file.bytes != null) {
      // For web platform, use bytes property to access the content
      String content = String.fromCharCodes(file.bytes!);
      return content;
    } else {
      throw Exception("Unsupported file format");
    }
  } catch (e) {
    return 'Error reading file: $e';
  }
}
