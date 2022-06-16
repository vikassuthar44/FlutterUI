import 'package:flutter/material.dart';
import 'package:ui_flutter/screens/OtpScreen.dart';
import 'package:ui_flutter/screens/EComAppHomeScreen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color whatsappcolor = Color(0xfff);
    return MaterialApp(
      title: "Flutter UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home:  EComAppHomeScreen(),
    );
  }
}
