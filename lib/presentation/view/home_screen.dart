import 'package:book_shop/data/datasource/local/local_database.dart';
import 'package:book_shop/presentation/blocs/categories_blocs/category_bloc.dart';
import 'package:book_shop/presentation/widgets/item_description_widget.dart';
import 'package:book_shop/utils/constanst/All_color.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/category_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabbarTexts.length, vsync: this);
  }

  TextStyle style = const TextStyle(color: Colors.white);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.bacColor,
      appBar: AppBar(
        backgroundColor: AllColors.primary,
        centerTitle: true,
        title: Text(
          AllText.apbar,
          style: style.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AllColors.primaryWhite,
          ),
          onPressed: () {},
        ),
        actions: [

        ],
        bottom: TabBar(
            onTap: (index) {
              count = index;
              context.read<CategoryBloc>().add(TakeCategoryItemEvent(index));
            },
            indicatorColor: Colors.white,
            controller: tabController,
            mouseCursor: MouseCursor.defer,
            unselectedLabelStyle: customStyle.copyWith(color: AllColors.buttonGrey),
            labelStyle: customStyle,
            tabs: tabbarTexts
                .map(
                  (e) => Tab(
                    child: Text(e),
                  ),
                )
                .toList()),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {
            return Container(
              alignment: Alignment.center,
              child: const Text('Initial State'),
            );
          } else if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoaded) {
            print('CategoryLoaded ISHLAVOTTI $count');
            return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: List.generate(
                    tabbarTexts.length,
                    (index) => count == index
                        ? GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.cateItemList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.9,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int indexx) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDescWidget(
                                                    model: state.cateItemList[
                                                        indexx])));
                                  },
                                  child: CategoryItemWidget(
                                    indexx: indexx,
                                    list: state.cateItemList,
                                  ));
                            })
                        : const SizedBox.shrink()).toList());
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          return const Center(
            child: Text('Bloc Ishlamadi'),
          );
        },
      ),

    );

  }
}
