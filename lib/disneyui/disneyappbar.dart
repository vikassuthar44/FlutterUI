import 'package:flutter/material.dart';


AppBar disneyAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: const Color(0xFF202436),
    title: SizedBox(
      height: kToolbarHeight,
      child: Image.asset("images/disney_plus_logo.png", color: Colors.white,),
    ),
  );
}