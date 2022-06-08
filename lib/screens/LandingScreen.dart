import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final Color _accentColor = const Color(0xFFD64CA2);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular((size.width / 2))),
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [_accentColor.withOpacity(0.5), _accentColor],
                          stops: const [0.0, 1.0])))),
           Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const Image(
                       width: 100,
                       height: 100,
                       image: AssetImage("images/flying-kite.png")
                   ),
                   const Text(
                    "Welcome to Kidly!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                  const SizedBox(height: 20.0,),
                  const Text(
                    "Welcome to Kidly!",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                  const Image(
                      image: AssetImage("images/playing_kid.png")),
                  const SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              elevation: 2,
                              backgroundColor: _accentColor),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0,),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              elevation: 2,
                              backgroundColor: _accentColor),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 1.0,
                        color: Colors.black26,
                      ),
                      const SizedBox(width: 10.0,),
                      const Text("or", style: TextStyle(color: Colors.black38),),
                      const SizedBox(width: 10.0,),
                      Container(
                        width: 100,
                        height: 1.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                elevation: 2,
                                backgroundColor: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage("images/google.png"),
                                  width: 25,
                                  height: 25,
                                  color: null,
                                ),
                                SizedBox(width: 10.0,),
                                Text(
                                  "Google",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              elevation: 2,
                              backgroundColor: Colors.blueAccent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.facebook_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.0,),
                              Text(
                                "Facebook",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ),
                      ),
                    ],
                  )
                ],
              )
           )
        ],
      ),
    );
  }
}
