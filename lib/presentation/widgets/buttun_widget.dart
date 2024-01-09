import 'package:flutter/material.dart';

import '../../utils/constanst/All_text.dart';
class ButtonWidget extends StatelessWidget {
   final Function()? onTap;
   final String text;
  const ButtonWidget({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.yellow
        ),
        child: Text(text,style: customStyle.copyWith(color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 1),),
      ),
    );
  }
}
