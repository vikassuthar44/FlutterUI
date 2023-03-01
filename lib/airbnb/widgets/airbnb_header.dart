import 'package:flutter/material.dart';
class AirbnbHeader extends StatelessWidget {
  final String header;
  const AirbnbHeader({
    required this.header,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15),
        child: Text(
          header,
          style: TextStyle(color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
