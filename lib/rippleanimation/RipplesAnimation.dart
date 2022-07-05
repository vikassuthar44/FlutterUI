import 'package:flutter/material.dart';
import 'package:ui_flutter/rippleanimation/CirclePainter.dart';

class RipplesAnimation extends StatefulWidget {
  const RipplesAnimation({Key? key}) : super(key: key);

  @override
  State<RipplesAnimation> createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ripple Animation Demo"),
      ),
      body: Center(
        child: CustomPaint(
          painter: CirclePainter(
            _controller,
            colorValue: Colors.blueAccent
          ),
          child:  SizedBox(
            width: size.width,
            height: size.height,
            child: const Center(
              child: Text("Searching...", style: TextStyle(color: Colors.white),)
            ),
          ),
        ),
      ),
    );
  }
}
