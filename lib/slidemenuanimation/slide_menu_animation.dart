import 'package:flutter/material.dart';

class SlideMenuAnimation extends StatefulWidget {
  SlideMenuAnimation({Key? key}) : super(key: key);
  bool _isDrawerOpen = false;
  static const _menuTitles = [
    'Declarative style',
    'Premade widgets',
    'Stateful hot reload',
    'Native performance',
    'Great community',
  ];

  @override
  State<SlideMenuAnimation> createState() => _SlideMenuAnimationState();
}

class _SlideMenuAnimationState extends State<SlideMenuAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideAnimationController;

  @override
  void initState() {
    _slideAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    super.initState();
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _slideAnimationController.value == 1.0;
  }

  bool _isDrawerClosed() {
    return _slideAnimationController.value == 0.0;
  }

  bool _isDrawerOpening() {
    return _slideAnimationController.status == AnimationStatus.forward;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _slideAnimationController.reverse();
    } else {
      _slideAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slide Menu Animation"),
        actions: [
          AnimatedBuilder(
              animation: _slideAnimationController,
              builder: (context, child) {
                return IconButton(
                  onPressed: _toggleDrawer,
                  icon: _isDrawerOpen() || _isDrawerOpening()
                      ? const Icon(Icons.clear)
                      : const Icon(Icons.menu),
                );
              }),
        ],
      ),
      body: Stack(
        children: [_menuContent(), _drawerContent()],
      ),
    );
  }

  Widget _drawerContent() {
    return AnimatedBuilder(
        animation: _slideAnimationController,
        builder: (context, child) {
          return _isDrawerClosed()
              ? const Center(child: Text("Drawer Closed"))
              : const Menu();
        });
  }

  Widget _menuContent() {
    return const Center();
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {

  static const _menuTitles = [
    'Declarative style',
    'Premade widgets',
    'Stateful hot reload',
    'Native performance',
    'Great community',
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationTime = _initialDelayTime +
      (_staggerTime * _menuTitles.length) + _buttonDelayTime + _buttonTime;

  late AnimationController _staggerController;
  final List<Interval> _itemSlideInterval = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    _createAnimationInterval();
    _staggerController = AnimationController(
        vsync: this,
        duration: _animationTime)
      ..forward();
    super.initState();
  }

  void _createAnimationInterval() {
    for (var i = 0; i < _menuTitles.length; i++) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideInterval.add(
          Interval(startTime.inMilliseconds / _animationTime.inMilliseconds,
              endTime.inMilliseconds / _animationTime.inMilliseconds)
      );
    }

    final _buttonStartTime = Duration(milliseconds: (_menuTitles.length * 50)) +
        _buttonDelayTime;
    final _buttonEndTime = _buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
        _buttonStartTime.inMilliseconds / _animationTime.inMilliseconds,
        _buttonEndTime.inMilliseconds / _animationTime.inMilliseconds);
  }

  @override
  void dispose() {
    _staggerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          //_buildFlutterLogo(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        ..._buildListItem(),
        const SizedBox(height: 50,),
        _buildButton(),
      ],
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: AnimatedBuilder(
            animation: _staggerController,
            builder: (context, child) {
              final animationPercent = Curves.elasticOut.transform(
                  _buttonInterval.transform(_staggerController.value));
              final opacity = animationPercent.clamp(0.0, 1.0);
              final scale = (animationPercent * 0.5) + 0.5;

              return Opacity(
                opacity: opacity,
                child: Transform.scale(
                  scale: scale,
                  child: child,
                ),
              );
            },
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
              ),
              onPressed: () {},
              child: const Text(
                'Get started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
        ),
      ),
    );
  }

  List<Widget> _buildListItem() {
    final listItem = <Widget>[];
    for (var i = 0; i < _menuTitles.length; i++) {
      listItem.add(
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Click on ${_menuTitles[i]}")));
            },
            child: AnimatedBuilder(
              animation: _staggerController,
              builder: (context, child) {
                final animationPercent = Curves.easeOut.transform(
                  _itemSlideInterval[i].transform(_staggerController.value),
                );
                final opacity = animationPercent;
                final slideDistance = (1.0 - animationPercent) * 150;

                return Opacity(
                  opacity: opacity,
                  child: Transform.translate(
                    offset: Offset(slideDistance, 0),
                    child: child,
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                  child: Text(
                    _menuTitles[i],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )
      );
    }
    return listItem;
  }

  Widget _buildFlutterLogo() {
    return const Positioned(
      right: -100,
      bottom: 100,
      child: Opacity(
        opacity: 0.2,
        child: FlutterLogo(
          size: 400,
        ),
      ),
    );
  }
}

