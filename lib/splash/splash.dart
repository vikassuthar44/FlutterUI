
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  void _onPress() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Image(
                  width: 300,
                  height: 300,
                  image: AssetImage("images/surfing.png")
              ),
              const SizedBox(height: 50),
              const Text("Welcome", style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              const Text(
                "Stay organised and live stress-free \nwith you do app",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child:  ElevatedButton(
                    onPressed: () {
                      _onPress();
                    },
                    child: const ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      title: Text("Sign Up"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    )
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Already have an account? "),
                  Text("Login", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}