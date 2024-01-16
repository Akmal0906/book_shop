import 'package:flutter/material.dart';

class FreeBookScreen extends StatelessWidget {
  const FreeBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        children: [],
      ),
    ));
  }
}
