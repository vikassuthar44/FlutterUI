class CoinbaseCoinData {
  final num time;
  final num high;
  final num low;
  final num open;
  final num volumeFrom;
  final num volumeTo;
  final num close;
  final String conversionType;
  final String conversionSymbol;

  CoinbaseCoinData(
      {required this.time,
      required this.high,
      required this.low,
      required this.open,
      required this.volumeFrom,
      required this.volumeTo,
      required this.close,
      required this.conversionType,
      required this.conversionSymbol});

  factory CoinbaseCoinData.toFromMap(Map<String, dynamic> map) {
    return CoinbaseCoinData(
      time: map['time'] ?? 0,
      high: map['high'] ?? 0.0,
      low: map['low'] ?? 0.0,
      open: map['open'] ?? 0.0,
      volumeFrom: map['volumefrom'] ?? 0.0,
      volumeTo: map['volumeto'] ?? 0.0,
      close: map['close'] ?? 0.0,
      conversionType: map['conversionType'] ?? "",
      conversionSymbol: map['conversionSymbol'] ?? ""
    );
  }
}
