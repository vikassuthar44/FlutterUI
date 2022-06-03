import 'package:flutter/material.dart';
import 'package:flutter_ui/screens/SignInPage.dart';
import 'package:flutter_ui/screens/SearchFilterBottomSheet.dart';
import 'package:flutter_ui/screens/ShipDemo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scratch App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home:  SearchBottomSheetScreen(),
    );
  }
}
