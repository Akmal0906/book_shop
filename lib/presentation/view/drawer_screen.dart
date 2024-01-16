import 'dart:core';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Akmal',
              style: customStyle.copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              'default@gmail.com',
              style: customStyle.copyWith(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://www.looper.com/img/gallery/9-times-dean-winchester-was-the-biggest-hypocrite-on-supernatural/intro-1668767332.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4AffBm7JPaU_qaaRN9md5TmYcUgZNoKHY3mf42LvkBKY7OCld8LRC0Sxi15aRFbm6avQ&usqp=CAU',
                    ),
                    fit: BoxFit.cover)),
            onDetailsPressed: () {},
          ),
          ...List.generate(
            4,
            (index) => ListTile(
              contentPadding: EdgeInsetsGeometry.lerp(
                  const EdgeInsets.only(left: 0),
                  const EdgeInsets.only(left: 12, top: 0),
                  1),
              onTap: () {},
              title: Text(
                listTitle[index],
                style: customStyle,
              ),
              leading: listIcon[index],
            ),
          ),
        ],
      ),
    );
  }
}
