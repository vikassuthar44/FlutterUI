import 'package:flutter/material.dart';


class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key, required this.color,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
      ),
    );
  }
}