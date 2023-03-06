
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ui_flutter/coinbase/models/coinbase_coin.dart';
import 'package:ui_flutter/coinbase/models/coinbase_coin_data.dart';
import 'package:ui_flutter/coinbase/services/coinbase_repository.dart';
import 'package:ui_flutter/coinbase/utils/coinbase_theme.dart';

class CoinbaseCoinDetails extends StatefulWidget {
  final CoinbaseCoin coinbaseCoin;

  const CoinbaseCoinDetails({required this.coinbaseCoin, Key? key})
      : super(key: key);

  @override
  State<CoinbaseCoinDetails> createState() => _CoinbaseCoinDetailsState();
}

class _CoinbaseCoinDetailsState extends State<CoinbaseCoinDetails> {
  late Future<List<CoinbaseCoinData>> _getCoinHourly;
  late double _coinPrice;

  @override
  void initState() {
    _getCoinHourly = CoinbaseRepository.getCoinHourlyData(widget.coinbaseCoin.ticker);
    _coinPrice = widget.coinbaseCoin.price;
    super.initState();
  }

  convertToSpots(List<CoinbaseCoinData> coinData) {
    final List<FlSpot> spot = [];
    double maxPrice = 0.0;
    double minPrice = double.maxFinite;
    double maxTime = 0.0;
    double minTime = double.maxFinite;
    const normalizer = 1000;

    //for loop over coin data
    for (var i = 0; i < coinData.length; i++) {
      final CoinbaseCoinData coin = coinData[i];
      final double price = coin.high.toDouble();
      final double time = coin.time.toDouble() / normalizer;
      if (price > maxPrice) {
        maxPrice = price;
      }
      if (price < minPrice) {
        minPrice = price;
      }
      if (time > maxTime) {
        maxTime = time;
      }
      if (time < minTime) {
        minTime = time;
      }
      spot.add(FlSpot(time, price));
    }
    return [spot, maxPrice, maxTime, minPrice, minTime];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.coinbaseCoin.fullName,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
        child: ListView(
          children: [
            Text(
              "${widget.coinbaseCoin.fullName} price",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey.shade700),
            ),
            Text(
              "\$ ${_coinPrice.toStringAsFixed(2)} ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black),
            ),
            //graph here
            const SizedBox(
              height: 50,
            ),
            FutureBuilder<List<CoinbaseCoinData>>(
                future: _getCoinHourly,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                    final f = convertToSpots(snapshot.data!);
                    return CoinHourlyWidget(
                        flsopts: f[0],
                        maxPrice: f[1],
                        maxTime: f[2],
                        minPrice: f[3],
                        minTime: f[4],
                        priceCallback: (d) {
                          setState(() {
                            _coinPrice = d ?? widget.coinbaseCoin.price;
                          });
                        });
                  }
                  return const Text("Loading...");
                }),
            coinAdditionalInfo(),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15)),
                    backgroundColor:
                        MaterialStateProperty.all(CoinbaseTheme.color)),
                child: const Text(
                  "Trade",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ))
          ],
        ),
      )),
    );
  }

  Widget coinAdditionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.coinbaseCoin.fullName,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.coinbaseCoin.ticker,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: Colors.grey.shade300,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Additional Information:",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Algorithm: ${widget.coinbaseCoin.algorithm}",
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          "Block Number: ${widget.coinbaseCoin.blockNumbers.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          "Block Reward: ${widget.coinbaseCoin.blockReward.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          "Block Time: ${widget.coinbaseCoin.blockTime.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          "Max Supply: ${widget.coinbaseCoin.maxSupply}",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class CoinHourlyWidget extends StatefulWidget {
  final List<FlSpot> flsopts;
  final double maxPrice;
  final double maxTime;
  final double minPrice;
  final double minTime;
  final Function(double?) priceCallback;
  const CoinHourlyWidget({
    required this.flsopts,
    required this.maxPrice,
    required this.maxTime,
    required this.minPrice,
    required this.minTime,
    required this.priceCallback,
    Key? key}) : super(key: key);

  @override
  State<CoinHourlyWidget> createState() => _CoinHourlyWidgetState();
}

class _CoinHourlyWidgetState extends State<CoinHourlyWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.transparent,
          gridData: FlGridData(
            show: false,
            drawVerticalLine: true,
            horizontalInterval: 1,
            verticalInterval: 1
          ),
          lineTouchData: LineTouchData(
            enabled: true,
            touchCallback: (c,cc) {
              widget.priceCallback(cc?.lineBarSpots?[0].y);
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipPadding:  const EdgeInsets.all(10),
            ),
          ),
          showingTooltipIndicators: [],
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false)
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white,width: 0),
          ),
          minX: widget.minTime,
          maxX: widget.maxTime,
          minY: widget.minPrice,
          maxY: widget.maxPrice,
          lineBarsData: [
            LineChartBarData(
              spots: widget.flsopts,
              isCurved: false,
              color: CoinbaseTheme.color,
              barWidth: 2,
              isStrokeCapRound: false,
              dotData: FlDotData(
                show: false,
              ),
            )
          ]
        )
      ),
    );
  }
}

