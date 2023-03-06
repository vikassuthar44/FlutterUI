import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ui_flutter/coinbase/models/coinbase_coin.dart';
import 'package:ui_flutter/coinbase/models/coinbase_coin_data.dart';
import 'package:ui_flutter/coinbase/models/coinbase_data_error.dart';
class CoinbaseRepository {
  static const String _baseUrl = "https://min-api.cryptocompare.com/";

  static Future<List<CoinbaseCoin>> getCoins() async {
    const requestUrl = "${_baseUrl}data/top/totalvolfull?limit=50&tsym=USD&page=0";

    try {
      final response = await http.Client().get(Uri.parse(requestUrl));
      if(response.statusCode == 200) {
        //log("Vikas " + response.body.toString());
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final data = json['Data'] as List<dynamic>;
        return data.map((e) {
          return CoinbaseCoin.fromMap(e);
        }).toList();
      } else {
        throw const CoinbaseDataError(message: "Failed to load currencies");
      }
    } catch (err) {
      throw CoinbaseDataError(message: err.toString());
    }
  }

  static Future<List<CoinbaseCoinData>> getCoinHourlyData(String ticker) async {
    final requestUrl = '${_baseUrl}data/v2/histohour?fsym=$ticker&tsym=USD&limit=25';
    try {
       final response = await http.Client().get(Uri.parse(requestUrl));
       if(response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final data = json['Data']['Data'] as List<dynamic>;
          log("Response : ${data.toString()}");
          return data.map((e) {
            return CoinbaseCoinData.toFromMap(e);
          }).toList();
       } else {
         log("Response : fialed");
         throw const CoinbaseDataError(message: "Failed to load Coins data!");
       }
    } catch(err) {
      log("Response : error $err");
      throw CoinbaseDataError(message: err.toString());
    }
  }
}