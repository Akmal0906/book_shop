import 'dart:core';
import 'package:book_shop/data/datasource/local/local_database.dart';
import 'package:book_shop/presentation/blocs/categories_blocs/category_bloc.dart';
import 'package:book_shop/presentation/view/combain_screen.dart';
import 'package:book_shop/presentation/view/free_book_screen.dart';
import 'package:book_shop/presentation/widgets/authors_screen.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerScreen extends StatelessWidget {
  final String name;
  final String email;

  const DrawerScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
              style: customStyle.copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              email,
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
              onTap: () async {
                if (index == 1) {
                  context
                      .read<CategoryBloc>()
                      .add(const TakeCategoryItemEvent(3));
                  Future.delayed(
                      const Duration(
                        seconds: 1,
                      ), () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FreeBookScreen()));
                  });
                } else if (index == listTitle.length - 1) {
                  await LocalDatabase().clearAllData();
                  if (context.mounted) {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CombainScreen()));
                  }
                }else if(index==0){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AuthorsScreen()));
                }
              },
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
