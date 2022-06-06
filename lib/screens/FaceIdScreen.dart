import 'package:flutter/material.dart';


class FaceIdScreen extends StatefulWidget {

  @override
  _FaceIdScreenState createState() => _FaceIdScreenState();
}


class _FaceIdScreenState extends State<FaceIdScreen> {
  final Color _accentColor = const Color(0xFF164CA2);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  _accentColor.withOpacity(0.5),
                  _accentColor
                ],
                stops: const [
                  0.0,
                  1.0
                ]
              )
            ),
          ),
          Align(
            alignment: Alignment(0, -0.1),
            child: Column(
              
            ),
          )
        ],
      )
    );
  }

}