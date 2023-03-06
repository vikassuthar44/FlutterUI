import 'package:flutter/material.dart';
class LandingPageMusic extends StatelessWidget {
  const LandingPageMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: const Image(
              fit: BoxFit.fitHeight,
                image: AssetImage("images/listen_music.jpg"),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.width-100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Let's Enjoy With \nBest Product", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white60, fontWeight: FontWeight.w600, fontSize: 32
                  ),
                    textAlign: TextAlign.center,
                  ),
                  Text("Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do \neiusmod tempor incididunt ut", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white60, fontWeight: FontWeight.w600, fontSize: 16
                  ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Click on Button")));
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                      child: const Text("Let's Go", style: TextStyle(color: Colors.black),))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
