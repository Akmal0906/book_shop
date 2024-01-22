import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final String imageUrl;

  const SliderWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imageUrl,fit: BoxFit.cover,height: 100,width: 800,),
    );
  }
}
