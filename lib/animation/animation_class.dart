import 'dart:ui';

import 'package:flutter/material.dart';

import '../landingpage/widget/custom_cricle.dart';

class AnimationList extends StatelessWidget {
  const AnimationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Stack(
          children: [
            const Positioned(
                top: 0, left: -20, child: CustomCircle(color: Colors.orange)),
            const Positioned(
                bottom: 230,
                left: -100,
                child: CustomCircle(color: Colors.orange)),
            const Positioned(
                top: 230, right: -100, child: CustomCircle(color: Colors.orange)),
            const Positioned(
                bottom: 0, right: -20, child: CustomCircle(color: Colors.orange)),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                  child: Container(
                    clipBehavior: Clip.none,
                    width: size.width * 0.9,
                    height: size.height * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.5), width: 1.5),
                    ),
                    child: const ItemPicker(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemPicker extends StatefulWidget {
  const ItemPicker({Key? key}) : super(key: key);

  @override
  State<ItemPicker> createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double listContainerBorderWidth = 1.5;
    final Size size = MediaQuery.of(context).size;
    const int itemsCount = 10;
    double itemHeight =
        (size.height * 0.9 - listContainerBorderWidth * 2) / itemsCount;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          AnimatedPositioned(
              top: selectedItemIndex * itemHeight,
              left: 0,
              right: 0,
              height: itemHeight,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                    width: 1.5
                  )
                ),
              )),
          Positioned.fill(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                10,
                (index) => Expanded(
                        child: InkWell(
                      onTap: () => setState(() => selectedItemIndex = index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'List Item ${index + 1}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
          ))
        ],
      ),
    );
  }
}
