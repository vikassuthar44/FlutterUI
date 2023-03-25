import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
  String title = "";

  MovieWidget({required this.title, Key? key}) : super(key: key);

  static List<String> covers = [
    'https://media.comicbook.com/uploads1/2015/06/antmanposter-139745.jpg',
    'https://i.pinimg.com/236x/92/5d/e8/925de870f00d0f1f83502772bbc6c84c.jpg',
    'https://hips.hearstapps.com/digitalspyuk.cdnds.net/13/18/comics-infinity-1-cover-artwork.jpg',
    'https://i.pinimg.com/originals/69/3b/5a/693b5ae03a25cb9d3a6ce3f567d1f817.jpg',
    'https://i.pinimg.com/736x/fd/12/df/fd12dfea52d3f17c9ef93a148ccf2c4c.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 5,),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: covers.length,
              itemBuilder: (context, index) {
                return showMovie(covers[index]);
              }),
        )
      ],
    );
  }

  Widget showMovie(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 200,
      width: 120,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
