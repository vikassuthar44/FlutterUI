import 'package:flutter/material.dart';

import '../widgets/airbnb_header.dart';
import '../widgets/airbnb_live_anywhere.dart';
import '../widgets/aribnb_city.dart';
import '../widgets/fade_app_bar.dart';
import '../widgets/hero_banner.dart';

class AirbnbHomePage extends StatefulWidget {
  const AirbnbHomePage({Key? key}) : super(key: key);

  @override
  State<AirbnbHomePage> createState() => _AirbnbHomePageState();
}

class _AirbnbHomePageState extends State<AirbnbHomePage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
           CustomScrollView(
             controller: _scrollController,
            slivers: [
              HeroBanner(),
              AirbnbHeader(header: "Explore Nearby"),
              AirbnbCity(),
              AirbnbHeader(header: "Live Anywhere"),
              AirbnbLiveAnywhere()
            ],
          ),
          FadeAppBar(scrollOffset: _scrollControllerOffset)
        ],
      )
    );
  }
}
