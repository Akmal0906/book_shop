import 'package:book_shop/presentation/widgets/slider_widget.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int currentIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 24),
      child: Column(
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            disableGesture: false,
            items: sliderList.map((e) => SliderWidget(imageUrl: e)).toList(),
            options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                height: 200,
                aspectRatio: 2.0,
                reverse: true,
                autoPlayInterval: const Duration(seconds: 2),
                pageSnapping: false,
                enlargeCenterPage: true,
                pauseAutoPlayInFiniteScroll: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          const SizedBox(
            height: 12,
          ),
          AnimatedSmoothIndicator(
            onDotClicked: (index) {
              setState(() {
                currentIndex = index;
                buttonCarouselController.animateToPage(currentIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut);
              });
            },
            activeIndex: currentIndex,
            count: sliderList.length,
            effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                spacing: 7,
                dotColor: Colors.grey.shade200,
                activeDotColor: Colors.grey.shade500,
                paintStyle: PaintingStyle.fill),
          ),
        ],
      ),
    );
  }
}
