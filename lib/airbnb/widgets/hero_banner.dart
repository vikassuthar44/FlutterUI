import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.1,
        child: Stack(
          children: [
            Image.network(
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/airbnb%2Fairbnb_home.webp?alt=media&amp;token=27e4e303-eac2-4144-945f-73769bcb81f7&quot;",
              height: MediaQuery.of(context).size.height / 2.1,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Not sure where to go? \nPerfect",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12.5),
                          elevation: 10,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.purple, Colors.pink]).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height)
                        ),
                        child: const Text(
                          "I'm Flexible",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
