import 'package:flutter/material.dart';
// import 'chatScreen.dart';
// import 'Navigation.dart';
import 'Notification.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ChatListScreen(), // just render the other file
      // home: UserFormScreen(),
      home: NotificationsScreen(),
    );
  }
}
