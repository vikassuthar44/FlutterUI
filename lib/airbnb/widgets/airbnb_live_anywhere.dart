import 'package:flutter/material.dart';

import '../models/Place.dart';

class AirbnbLiveAnywhere extends StatelessWidget {
  AirbnbLiveAnywhere({Key? key}) : super(key: key);

  List<Place> places = [
    Place(
        title: "Outdoor Getaways",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/airbnb%2Fnature.jpeg?alt=media&token=d0dda841-e419-4be0-aa0e-56dcdd42acfd"),
    Place(
        title: "Unique Stays",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/airbnb%2Funique.jpeg?alt=media&token=669e01b2-64b9-47e5-a160-e1a8db1c1c7e"),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
        child: ListView.builder(
            itemCount: places.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return LiveWidget(place: places[index]);
            }),
      ),
    );
  }
}

class LiveWidget extends StatelessWidget {
  final Place place;

  const LiveWidget({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            place.image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          place.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black.withOpacity(0.9)),
        )
      ]),
    );
  }
}
