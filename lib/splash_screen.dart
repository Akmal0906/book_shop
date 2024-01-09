import 'dart:async';

import 'package:book_shop/presentation/view/combain_screen.dart';
import 'package:book_shop/utils/constanst/All_color.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  void nextScreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const CombainScreen()), (
          route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AllText.splash,
              style: TextStyle(
                  fontSize: 10 * MediaQuery
                      .of(context)
                      .devicePixelRatio, fontFamily: 'textFont',
                  fontWeight: FontWeight.w400),
            ),
            const Text(
              AllText.apbar,
              style: TextStyle(
                  color: AllColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
