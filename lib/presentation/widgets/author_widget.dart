import 'package:book_shop/utils/constanst/All_color.dart';
import 'package:flutter/material.dart';

import '../../utils/constanst/All_text.dart';
class AuthorWidget extends StatelessWidget {
  final String name;
  final String description;
  const AuthorWidget({
    super.key,required this.name,required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),alignment: Alignment.center,
      decoration: BoxDecoration(
        color:AllColors.bacColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: AllColors.bacColor.withOpacity(0.4),
                spreadRadius: 7,
                blurRadius: 1
            ),
          ]
      ),
      child: ListTile(
        title: Text(name,
          style: customStyle.copyWith(fontSize: 18,fontWeight: FontWeight.w600),),
        subtitle: Text(description,
          style: customStyle.copyWith(
              fontSize: 15, fontWeight: FontWeight.w400),),
      ),
    );
  }
}