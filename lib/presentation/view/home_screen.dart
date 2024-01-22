import 'package:book_shop/data/datasource/local/local_database.dart';
import 'package:book_shop/presentation/blocs/categories_blocs/category_bloc.dart';
import 'package:book_shop/presentation/view/drawer_screen.dart';
import 'package:book_shop/presentation/view/slider_screen.dart';
import 'package:book_shop/presentation/widgets/item_description_widget.dart';
import 'package:book_shop/utils/constanst/All_color.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/textfield_models/sign_user_model.dart';
import '../widgets/category_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabbarTexts.length, vsync: this);
  }

  TextStyle style = const TextStyle(color: Colors.white);
  int count = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AllColors.bacColor,
      appBar: AppBar(
        backgroundColor: AllColors.primary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          AllText.apbar,
          style: style.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: ()async{
              LocalDatabase().hasToken().then((value) {
                if (value == true) {
                  LocalDatabase().readAllData().then((value) {
                    var model = SignUserModel.fromJson(value.first);
                    name = model.username;
                    email = model.email;
                    setState(() {});
                  });
                } else {
                  setState(() {
                    name = 'Unknown';
                    email = 'default321@gmail.com';
                    print(name.toString());
                    print(email.toString());
                  });
                }

                _scaffoldKey.currentState!.openDrawer();
              });
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        bottom: TabBar(
            onTap: (index) {
              count = index;
              context.read<CategoryBloc>().add(TakeCategoryItemEvent(index));
            },
            indicatorColor: Colors.white,
            controller: tabController,
            mouseCursor: MouseCursor.defer,
            unselectedLabelStyle:
                customStyle.copyWith(color: AllColors.buttonGrey),
            labelStyle: customStyle,
            tabs: tabbarTexts
                .map(
                  (e) => Tab(
                    child: Text(e),
                  ),
                )
                .toList()),
      ),
      drawer: DrawerScreen(name: name ?? '', email: email ?? ''),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          print('BLOC WORKING');
          if (state is CategoryInitial) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                AllText.pleaseWait,
                style: customStyle,
              ),
            );
          } else if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoaded) {
            return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: List.generate(
                    tabbarTexts.length,
                    (index) => count == index
                        ? ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              index == 0
                                  ? const SliderScreen()
                                  : const SizedBox.shrink(),
                              GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.cateItemList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1.9,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int indexx) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ItemDescWidget(
                                                          model: state
                                                                  .cateItemList[
                                                              indexx])));
                                        },
                                        child: CategoryItemWidget(
                                          indexx: indexx,
                                          list: state.cateItemList,
                                        ));
                                  }),
                            ],
                          )
                        : const SizedBox.shrink()).toList());
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          return Center(
            child: Text(
              AllText.pleaseWait,
              style: customStyle,
            ),
          );
        },
      ),
    );
  }


}
