import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constanst/All_color.dart';
import '../../utils/constanst/All_text.dart';
import '../../utils/constanst/all_bases_url.dart';

class CategoryItemWidget extends StatelessWidget {
  final List list;
  final int indexx;

  const CategoryItemWidget(
      {super.key, required this.list, required this.indexx});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        bottom: 9,
      ),
      margin: const EdgeInsets.all(10),
      width: size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AllColors.primaryWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: AllBasesUrl.baseUrl + list[indexx].picture,
              imageBuilder: (context, imageProvider) => Container(
                height: size.height / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Container(
                height: size.height / 4,
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
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Text(
              list[indexx].title,
              style: customStyle.copyWith(
                  fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w600),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list[indexx].author.first.name,
                  style: customStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5),
                ),
                IconButton(onPressed: (){


                }, icon:const Icon(Icons.favorite_border))
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    height: 32,
                    width: 108,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AllColors.primary,
                    ),
                    child: Text(
                      AllText.showMore,
                      style: customStyle.copyWith(
                        color: AllColors.primaryWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 32,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AllColors.primary,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/korzinla.svg',
                    fit: BoxFit.fill,
                    height: 16,
                    width: 16,
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
