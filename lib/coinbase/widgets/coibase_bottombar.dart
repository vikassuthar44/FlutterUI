import 'package:flutter/material.dart';
import 'package:ui_flutter/coinbase/utils/coinbase_theme.dart';

class CoinbaseBottomBar extends StatefulWidget {
  final Function(int) selectIndex;

  const CoinbaseBottomBar({required this.selectIndex, Key? key})
      : super(key: key);

  @override
  State<CoinbaseBottomBar> createState() => _CoinbaseBottomBarState();
}

class _CoinbaseBottomBarState extends State<CoinbaseBottomBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomIconButton(
                  title: "Assets",
                  icon: Icons.pie_chart_outline,
                  isSelected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                      widget.selectIndex(0);
                    });
                  }),
              BottomIconButton(
                  title: "Trade",
                  icon: Icons.bar_chart,
                  isSelected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                      widget.selectIndex(1);
                    });
                  }),
              BottomIconButton2(
                  icon: Icons.compare_arrows,
                  onPressed: () {
                    setState(() {
                      widget.selectIndex(2);
                    });
                  }),
              BottomIconButton(
                  title: "Pay",
                  icon: Icons.circle_outlined,
                  isSelected: _selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                      widget.selectIndex(3);
                    });
                  }),
              BottomIconButton(
                  title: "For You",
                  icon: Icons.account_box,
                  isSelected: _selectedIndex == 4,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 4;
                      widget.selectIndex(4);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomIconButton extends StatelessWidget {
  const BottomIconButton(
      {required this.title,
      required this.icon,
      required this.isSelected,
      required this.onPressed,
      Key? key})
      : super(key: key);

  final String title;
  final IconData icon;
  final bool isSelected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 25,
              color: isSelected
                  ? CoinbaseTheme.color
                  : Colors.black.withOpacity(0.75),
            )),
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: isSelected
                  ? CoinbaseTheme.color
                  : Colors.black.withOpacity(0.75)),
        )
      ],
    );
  }
}

class BottomIconButton2 extends StatelessWidget {
  const BottomIconButton2(
      {required this.icon, required this.onPressed, Key? key})
      : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CoinbaseTheme.color,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 25, color: Colors.white)),
    );
  }
}
