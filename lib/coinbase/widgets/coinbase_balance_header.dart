import 'package:flutter/material.dart';

class CoinbaseBalanceHeader extends StatelessWidget {
  final double balance;

  const CoinbaseBalanceHeader({required this.balance, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total balance",
            style:
                TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.55)),
          ),
          Text(
            "\$ ${balance.toStringAsFixed(2)}",
            style: const TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
