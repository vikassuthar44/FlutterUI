import 'package:flutter/material.dart';

Widget disneyBottomNavigation() {
  return Container(
    color: const Color(0xFF202436),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Divider(
          color: Colors.white12,
          thickness: 0.5,
          height: 0.5,
        ),
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: "Downloads"),
            BottomNavigationBarItem(icon: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("images/micky_mouse.png"),
              ),
            ),
              label: "Profile"
            )
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white54,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        )
      ],
    ),
  );
}
