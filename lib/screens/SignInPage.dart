import 'package:flutter/material.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text("Sign In", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800, color: Colors.black),),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    labelText: "Email Address",
                    labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14.0),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0,),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14.0)
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 40.0,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 60.0,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: const Center(
                    child: Text(
                        "Sign In",
                      style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              const Center(
                child: Text(
                    "Don't have account?",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100.0,
                    height: 1.0,
                    color: Colors.black38,
                  ),
                  const Text("OR"),
                  Container(
                    width: 100.0,
                    height: 1.0,
                    color: Colors.black38,
                  )
                ],
              ),
              const SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Row(
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
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.blueAccent
                    ),
                    child: Row(
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
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
