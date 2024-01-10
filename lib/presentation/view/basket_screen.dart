import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AllText.didNotAdd,style: customStyle.copyWith(fontSize: 22),),
      ),
    );
  }
}
