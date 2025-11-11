import 'package:flutter/material.dart';
import 'second.dart'; // Importing another file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      home: SecondScreen(), // Calling the widget from second.dart
    );
  }
}
