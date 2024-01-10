import 'package:book_shop/presentation/blocs/categories_blocs/category_bloc.dart';
import 'package:book_shop/presentation/widgets/category_item_widget.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.clear();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: TextField(
              onChanged: (value) {
                context.read<CategoryBloc>().add(TakeSearchItemEvent(value));

              },
              controller: controller,
              focusNode: FocusNode(debugLabel: 'Hello'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black26,
                      width: 1,
                    )),
                hintText:AllText.searchTitle,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
            ),
          ),
          BlocConsumer<CategoryBloc, CategoryState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is CategoryInitial) {
                return const SizedBox.shrink();
              }
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryItemSearchState) {
                return Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.cateItemList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 2,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryItemWidget(
                          list: state.cateItemList, indexx: index);
                    },
                  ),
                );
              } else if (state is EmptyState) {
                return Center(
                  child: Text(
                    state.str,
                    style:customStyle.copyWith(fontSize: 22),
                  ),
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text(state.error,style: customStyle,),
                );
              }
              return  Center(
                child: Text(
                  AllText.searchState,
                  style:customStyle.copyWith(fontSize: 22),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
