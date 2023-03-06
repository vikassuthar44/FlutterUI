import 'package:flutter/material.dart';
import 'package:ui_flutter/coinbase/services/coinbase_repository.dart';

import '../widgets/coibase_bottombar.dart';
import '../widgets/coinbase_asset_viewheader.dart';
import '../widgets/coinbase_balance_header.dart';
import '../widgets/coinbase_coin_display.dart';
import '../widgets/coinbase_topbar.dart';

class CoinbaseHomepage extends StatefulWidget {
  const CoinbaseHomepage({Key? key}) : super(key: key);

  @override
  State<CoinbaseHomepage> createState() => _CoinbaseHomepageState();
}

class _CoinbaseHomepageState extends State<CoinbaseHomepage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: const [
              CoinbaseTopBar(),
              CoinbaseBalanceHeader(balance: 259.54),
              CoinbaseAssetViewHeader(),
              CoinbaseCoinDisplay()
            ],
          ),
        ),
      ),
      bottomNavigationBar: CoinbaseBottomBar(
        selectIndex: (i) {
          // change the page according to the index
          // uncomment in case you want to implement more pages and make sure
          // to create a _selectedIndex variable

          // setState((){
          //   _selectedIndex = i;
          // })
        },
      ),
    );
  }
}
