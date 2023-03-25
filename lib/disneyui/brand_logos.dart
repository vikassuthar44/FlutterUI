import 'package:flutter/material.dart';

class BrandLogos extends StatelessWidget {
  const BrandLogos({Key? key}) : super(key: key);
  static List<String> logos = [
    'https://www.nicepng.com/png/full/23-233994_disney-logo-black-and-white-nba-finals-logo.png',
    'https://www.brandloyalty.com/cache/pixar.8711/pixar-s800x600.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/2560px-Marvel_Logo.svg.png',
    'https://www.freepnglogos.com/uploads/star-wars-logo-31.png',
    'https://cutewallpaper.org/24/national-geographic-logo-png/national-geographic-keith-ladzinski.png',
  ];

  final startColor = const Color.fromARGB(255, 54, 56, 70);
  final endColor = const Color.fromARGB(255, 39, 41, 53);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: logos.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
          return showBrandLogo(logos[index]);
          }
      ),
    );
  }

  Widget showBrandLogo(String imageUrl) {
    return Container(
      height: 80,
      width: 80,
      margin: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white54,
            width: 0.5
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              startColor,
              endColor
            ]
          )
        ),
        child: Image.network(imageUrl, fit: BoxFit.contain,),
      ),
    );
  }
}
