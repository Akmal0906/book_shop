import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';
class ProfileInfoWidget extends StatelessWidget {
 final String text;
 final String text2;
   const ProfileInfoWidget({super.key,required this.text,required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset:const  Offset(0, 5),
            spreadRadius: 4,
            color: Colors.grey.shade300
          ),
        ]
      ),
      child: ListTile(
        title: Text(text,style: customStyle,),
        subtitle: Text(text2,style: customStyle,),
        trailing:   IconButton(
          icon: const Icon(Icons.edit,color: Colors.grey,),
          onPressed: (){},
        ),

      ),
    );
  }
}
