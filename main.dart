import 'package:flutter/material.dart';
import 'tinder_profile_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TinderProfileScreen(), // just render the other file
    );
  }
}
