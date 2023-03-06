import 'package:flutter/material.dart';
import 'package:ui_flutter/landingpage/util/constant.dart';
import 'package:ui_flutter/landingpage/widget/custom_button.dart';
import 'package:ui_flutter/landingpage/widget/custom_cricle.dart';
import 'package:ui_flutter/splash/splash.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Stack(
          children: [
            Positioned(
              right: 120,
              top: -20,
              child: CustomCircle(color: darkPurple),
            ),
            Positioned(
              left: 120,
              top: 220,
              child: CustomCircle(color: lightPurple),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let's \nGet Started",
                    style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
                  ),
                  const Text(
                    "Grow Together",
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => SplashScreen())
                        );
                      },
                      child: CustomButton(
                        size: size.width * 0.7,
                        text: 'Join Now',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
