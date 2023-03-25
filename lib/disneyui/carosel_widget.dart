import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

  List<String> images = [
    "https://d23.com/app/uploads/2019/10/00-toy-story-4-az.jpg",
    "https://d23.com/app/uploads/2019/09/1-endgame-az.jpg",
    "https://d23.com/app/uploads/2017/05/1180w-600h_051917_event-cars-3-screening.jpg",
    "https://d23.com/app/uploads/2020/04/1180w-600h_011520-disney-az-frozen2.jpg",
  ];

  int currentPage = 1;
  final PageController _pageController = PageController(initialPage: 1, viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
        pageSnapping: true,
          itemBuilder: (context, index) {
          bool isCenter = index == currentPage;
          return showCarouselImage(images[index], isCenter);
          }
      ),
    );
  }

  AnimatedContainer showCarouselImage(String imageUrl, bool isCenter) {
    double margin = isCenter ? 0 : 20;
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: margin),
      duration: const Duration(microseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
      ),
    );
  }
}
