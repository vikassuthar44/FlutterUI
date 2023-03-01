import 'package:flutter/material.dart';
import 'package:ui_flutter/airbnb/widgets/airbnb_city_widget.dart';

import '../models/city.dart';

class AirbnbCity extends StatelessWidget {
  List<City> cities = [
    City(
        title: "Portland",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/airbnb%2Fportland.png?alt=media&token=5679fa53-c854-4833-bfb2-799ad4b83f34",
        subTitle: "1.5 hour drive"),
    City(
        title: "Boston",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/airbnb%2Fboston.png?alt=media&token=ddf740c9-0d85-4bd7-8cd3-3732029a3ea1",
        subTitle: "5 hour drive"),
    City(
        title: "Newark",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/airbnb%2Fnewark.png?alt=media&token=f845d590-c831-4942-94d0-f2b13c11c339",
        subTitle: "3 hour drive"),
    City(
        title: "New York",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/airbnb%2Fny.jpeg?alt=media&token=356763c5-18b1-4e22-96be-448756ae2b1c",
        subTitle: "8 hour drive"),
  ];

  AirbnbCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.5 / 1),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return CityCard(city: cities[index]);
          }, childCount: cities.length),

    );
  }
}
