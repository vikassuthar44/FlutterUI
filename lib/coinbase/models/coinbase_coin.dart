class CoinbaseCoin {
  final String ticker;
  final String fullName;
  final double price;
  final String imageUrl;
  final String algorithm;
  final num blockNumbers;
  final num blockTime;
  final num blockReward;
  final String assetLaunchDate;
  final num maxSupply;

  const CoinbaseCoin( {
      required this.ticker,
      required this.fullName,
      required this.price,
      required this.imageUrl,
      required this.algorithm,
      required this.blockNumbers,
      required this.blockTime,
      required this.blockReward,
      required this.assetLaunchDate,
      required this.maxSupply });

  factory CoinbaseCoin.fromMap(Map<String, dynamic> map) {
    return CoinbaseCoin(
        ticker: map['CoinInfo']?['Name'] ?? '',
        fullName: map['CoinInfo']?['FullName'] ?? '',
        price: (map['RAW']?['USD']?['PRICE'] ?? 0).toDouble(),
        imageUrl: "https://cryptocompare.com" + map['CoinInfo']?['ImageUrl'],
        algorithm: map['CoinInfo']?['Algorithm'] ?? '',
        blockNumbers: map['CoinInfo']?['BlockNumber'] ?? 0,
        blockTime: map['CoinInfo']?['BlockTime'] ?? 0,
        blockReward: map['CoinInfo']?['BlockReward'] ?? 0,
        assetLaunchDate: map['CoinInfo']?['AssetLaunchDate'] ?? '',
        maxSupply: map['CoinInfo']?['MaxSupply'] ?? 0);
  }
}