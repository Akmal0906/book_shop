import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constanst/All_text.dart';
class SignButtonWidget extends StatelessWidget {
  final String text;
  final String image;
  const SignButtonWidget({super.key,required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green
      ),
      child: ListTile(
        title: Text(text,style: customStyle.copyWith(color:Colors.white,letterSpacing: 2),),
        enabled: true,
        autofocus: true,
        selectedColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        trailing:SvgPicture.asset(image,fit: BoxFit.cover,height: 5,width: 5,),
        onTap: (){
          print('dsfg');
        },
      ),
    );
  }
}
