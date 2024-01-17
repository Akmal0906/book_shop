import 'package:book_shop/presentation/view/account_screen.dart';
import 'package:book_shop/presentation/view/basket_screen.dart';
import 'package:book_shop/presentation/view/home_screen.dart';
import 'package:book_shop/presentation/view/search_screen.dart';
import 'package:book_shop/utils/constanst/All_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/categories_blocs/category_bloc.dart';

class CombainScreen extends StatefulWidget {
  const CombainScreen({super.key});

  @override
  State<CombainScreen> createState() => _CombainScreenState();
}

class _CombainScreenState extends State<CombainScreen> {
  List<Widget> list = [
    const HomeScreen(),
    const BasketScreen(),
    const SearchScreen(),
    const AccountScreen()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    if(currentIndex==0){
      context.read<CategoryBloc>().add(const TakeCategoryItemEvent(0));
    }
    return Scaffold(
      extendBody: true,
      body: list[currentIndex],
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),

        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: AllColors.primary,
          selectedItemColor: Colors.red.shade400,
          unselectedItemColor: AllColors.primaryWhiteCha,
        
          onTap: (current){

            setState(() {
              currentIndex=current;
            });
          },
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg'),label: 'Home'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/korzinla.svg'),label: 'Basket'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/search.svg'),label: 'Search'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/account.svg'),label: 'Account'),
        
          ],
        ),
      ),
    );
  }
}
