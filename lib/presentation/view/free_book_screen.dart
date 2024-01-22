import 'package:book_shop/presentation/blocs/categories_blocs/category_bloc.dart';
import 'package:book_shop/presentation/widgets/item_description_widget.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:book_shop/utils/constanst/all_bases_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreeBookScreen extends StatelessWidget {
  const FreeBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoaded) {
            return ListWheelScrollView(
                itemExtent: size.height / 6 - 24,
                diameterRatio: 6,
                magnification: 1,
                squeeze: 0.9,
                offAxisFraction: 0,
                useMagnifier: false,
                children: List.generate(
                    state.cateItemList.length,
                    (index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ItemDescWidget(
                                    model: state.cateItemList[index])));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.only(top: 9,left: 5,right: 7),
                            height: size.height / 6,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: const Offset(4, 8),
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: AllBasesUrl.baseUrl +
                                      state.cateItemList[index].picture,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 100,
                                    height: 72,
                                    decoration: ShapeDecoration(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        width: 100,
                                        height: 72,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/defaultImage.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 7,),

                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.cateItemList[index].title,
                                              style: customStyle,
                                            ),
                                            Text(
                                              state.cateItemList[index]
                                                  .description,
                                              style: customStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons
                                                  .bookmark_outline_sharp)),
                                          Text(
                                            '${state.cateItemList[index].price}\$',
                                            style: customStyle.copyWith(
                                                color: Colors.orange.shade600,
                                                fontSize: 12),
                                            maxLines: 2,
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )));
          } else if (state is ErrorState) {
            return Center(
              child: Text(
                state.error,
                style: customStyle.copyWith(fontSize: 18),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ));
  }
}
