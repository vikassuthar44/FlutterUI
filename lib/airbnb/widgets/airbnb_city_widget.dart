import 'package:flutter/material.dart';

import '../models/city.dart';
class CityCard extends StatelessWidget {
  final City city;
  const CityCard({
    required this.city,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              city.image,
              width: 59,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(city.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(city.subTitle, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
