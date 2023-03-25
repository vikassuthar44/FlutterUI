import 'package:flutter/material.dart';
import 'package:ui_flutter/disneyui/disney_bottom_navigation.dart';
import 'package:ui_flutter/disneyui/disneyappbar.dart';

import 'brand_logos.dart';
import 'carosel_widget.dart';
import 'movie_widget.dart';


class DisneyHomePage extends StatelessWidget {
  const DisneyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202436),
      appBar: disneyAppBar(),
      bottomNavigationBar: disneyBottomNavigation(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            CarouselWidget(),
            SizedBox(height: 20,),
            BrandLogos(),
            SizedBox(height: 20,),
            MovieWidget(title: "Recommended Movie for You",),
            SizedBox(height: 20,),
            MovieWidget(title: "Hit Movies",)
          ],
        ),
      ),
    );
  }
}
