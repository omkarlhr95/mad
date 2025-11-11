import 'package:flutter/material.dart';
// import 'tinder_profile_card.dart';
import 'image_display_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TinderProfileScreen(),
      home: ImageDisplayScreen(), // just render the other file
    );
  }
}
