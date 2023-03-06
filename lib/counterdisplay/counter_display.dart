import 'package:flutter/material.dart';

class CounterDisplay extends StatefulWidget {
  const CounterDisplay({super.key});


  @override
  State<StatefulWidget> createState() => _CounterDisplayState();

}

class _CounterDisplayState extends State<CounterDisplay> {

  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterDisplayText(title: "Increment", onPressed: _increment),
          const SizedBox(width: 20),
          CounterIncrement(counter:_counter)
        ],
      ),
    );
  }
}

class CounterIncrement extends StatelessWidget {

  const CounterIncrement({
    required this.counter,
    super.key
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text("Count $counter");
  }

}

class CounterDisplayText extends StatelessWidget {

  const CounterDisplayText({
    required this.title,
    required this.onPressed,
    super.key
  });

  final String title;

  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(title)
    );
  }
}