import 'package:book_shop/data/datasource/local/local_database.dart';
import 'package:book_shop/presentation/blocs/get_books_bloc/book_bloc.dart';
import 'package:book_shop/presentation/registrs/sign_up_screen.dart';
import 'package:book_shop/presentation/view/item_screen.dart';
import 'package:book_shop/utils/constanst/All_color.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/models/categories_item/categories_item_model.dart';
import '../../utils/constanst/all_bases_url.dart';
import '../blocs/register/register_bloc.dart';

class ItemDescWidget extends StatelessWidget {
  final CateItemModel model;

  const ItemDescWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: CachedNetworkImage(
              imageUrl: AllBasesUrl.baseUrl + model.picture,
              imageBuilder: (context, imageProvider) => Container(
                height: size.height / 2.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Container(
                height: size.height / 2.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/defaultImage.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height / 2.7,
            width: size.width,
            height: size.height,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 14, bottom: 11),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: customStyle.copyWith(
                      fontSize: 24,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: 180,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AllColors.buttonBackColor,
                      ),
                      child: Text(
                        '${model.price}som',
                        style: customStyle.copyWith(
                            fontSize: 24,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff15978F)),
                      )),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.author.first.name,
                        style: customStyle.copyWith(
                            fontSize: 16,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                            color: AllColors.buttonGrey),
                      ),
                      Text(
                        model.active ? AllText.have : AllText.haveNot,
                        style: customStyle.copyWith(
                            fontSize: 14,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                            color: AllColors.buttonGrey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                        top: 13, bottom: 23, right: 29, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AllColors.textBackColor,
                    ),
                    child: Text(
                      ' In Flutter, letterSpacing is a property of the TextStyle class that specifies the amount of space (in logical pixels) to add between each letter. It essentially controls the space between characters in a text string.',
                      style: customStyle.copyWith(
                          color: AllColors.textdescColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 14, left: 22, right: 22),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () async{
                      BlocProvider.of<BookBloc>(context).add(GetBookEvent(
                          url:
                              'https://iambookish.pythonanywhere.com${model.eVersion}'));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ItemBookScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AllColors.buttonBackColor),
                      child: Text(
                        'open full document',
                        style: customStyle.copyWith(
                            color: AllColors.textBackColor),
                      ),
                    )),
                GestureDetector(
                  onTap: () async{

                    LocalDatabase().hasToken().then((value) {
                      if(value==true){

                      }else{
                        context.read<RegisterBloc>().add(RegisterInitial());
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      }

                    });

                  },
                  child: Container(
                    height: 27,
                    width: 29,
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AllColors.buttonBackColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/korzinla.svg',
                      fit: BoxFit.cover,
                      height: 20,
                      width: 20,
                      color: AllColors.textBackColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
