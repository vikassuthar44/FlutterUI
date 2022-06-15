import 'package:flutter/material.dart';
import 'package:ui_flutter/screens/OtpScreen.dart';
import 'package:ui_flutter/screens/ChatListScreen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color whatsappcolor = Color(0x128C7E);
    return MaterialApp(
      title: "Flutter UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home:  ChatListScreen(),
    );
  }
}
