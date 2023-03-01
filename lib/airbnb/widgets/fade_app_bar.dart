import 'package:flutter/material.dart';
import 'package:ui_flutter/airbnb/widgets/search_input.dart';
class FadeAppBar extends StatelessWidget {
  final double scrollOffset;
   FadeAppBar({required this.scrollOffset, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        child: Container(
          color: Colors.white.withOpacity((scrollOffset/350).clamp(0, 1).toDouble()),
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: const SafeArea(child:  SearchInput(),),
        ),

    );
  }
}
