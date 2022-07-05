import 'package:flutter/material.dart';
import 'package:ui_flutter/screens/OtpScreen.dart';
import 'package:ui_flutter/screens/WhatsAppProfileScreen.dart';
import 'package:ui_flutter/pageanimation/FirstPageScreen.dart';
import 'package:ui_flutter/rippleanimation/RipplesAnimation.dart';
import 'package:ui_flutter/animatedContainer/AnimatedContainerClass.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color whatsappcolor = Color(0xfff);
    return MaterialApp(
      title: "Flutter UI",
      debugShowCheckedModeBanner: false,
      home:  RipplesAnimation(),
    );
  }
}
