import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerClass extends StatefulWidget {
  const AnimatedContainerClass({Key? key}) : super(key: key);


  @override
  _AnimatedContainerClassState createState() => _AnimatedContainerClassState();
}

class _AnimatedContainerClassState extends State<AnimatedContainerClass> {

  //default Value
  double height = 100;
  double width = 100;
  Color color = Colors.green;
  BorderRadius borderRadius =  BorderRadius.all(Radius.circular(10.0));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container")
      ),
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius
          ),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState((){
            Random random = Random();
            width = random.nextInt(300).toDouble();
            height = random.nextInt(300).toDouble();
            borderRadius = BorderRadius.all(Radius.circular(random.nextInt(100).toDouble()));
            color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

}