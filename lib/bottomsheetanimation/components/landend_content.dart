import 'package:flutter/material.dart';
class LandendContent extends StatelessWidget {
  const LandendContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find Your \nDream Jobs",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold, fontSize: 42),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Get your dream job near by \nyou or any places",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.blueGrey.shade300, fontWeight: FontWeight.bold, fontSize: 24),
          )
        ],
      ),
    );;
  }
}
