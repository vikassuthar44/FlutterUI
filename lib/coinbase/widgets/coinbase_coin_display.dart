import 'package:flutter/material.dart';
import 'package:ui_flutter/coinbase/services/coinbase_repository.dart';
import 'package:ui_flutter/coinbase/widgets/coinbase_coin_details_page.dart';

import '../models/coinbase_coin.dart';

class CoinbaseCoinDisplay extends StatefulWidget {
  const CoinbaseCoinDisplay({Key? key}) : super(key: key);

  @override
  State<CoinbaseCoinDisplay> createState() => _CoinbaseCoinDisplayState();
}

class _CoinbaseCoinDisplayState extends State<CoinbaseCoinDisplay> {
  late Future<List<CoinbaseCoin>> _getCoins;

  @override
  void initState() {
    _getCoins = CoinbaseRepository.getCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoinbaseCoin>>(
        future: _getCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            final coins = snapshot.data ?? [];
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 40),
              child: Column(
                children: coins
                    .map((coin) => InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_) => CoinbaseCoinDetails(coinbaseCoin: coin)
                          ));
                        }, child: CoinbaseCard(coinbaseCoin: coin)))
                    .toList(),
              ),
            );
          }
          return const Center(child: Text("Loading"));
        });
  }
}

class CoinbaseCard extends StatelessWidget {
  final CoinbaseCoin coinbaseCoin;

  const CoinbaseCard({required this.coinbaseCoin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 12, top: 12),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              Image.network(
                coinbaseCoin.imageUrl,
                width: 35,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coinbaseCoin.fullName,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    coinbaseCoin.ticker.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              const Spacer(),
              Text(
                "\$ ${coinbaseCoin.price.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ));
  }
}
