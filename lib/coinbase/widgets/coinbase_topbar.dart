import 'package:flutter/material.dart';

class CoinbaseTopBar extends StatelessWidget {
  const CoinbaseTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications)
          )
        ],
    );
  }
}
