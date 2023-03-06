import 'package:flutter/material.dart';

class CoinbaseAssetViewHeader extends StatelessWidget {
  const CoinbaseAssetViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Top assets",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              Text(
                "View all",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          )
        ],
      ),
    );
  }
}
