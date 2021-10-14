import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../product_data.dart';
import 'dot_indicator.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(19)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Products",
                  style: kText18.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                Text(
                  "View All",
                  style: kText16.copyWith(color: Colors.grey.shade400),
                )
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          // Product table
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: productList,
            ),
          ),
          // product carousel
          ProductPageView()
        ],
      ),
    );
  }
}

class ProductPageView extends StatefulWidget {
  const ProductPageView({
    Key? key,
  }) : super(key: key);

  @override
  _ProductPageViewState createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  final _controller = new PageController();

  List<Color> colors = [Colors.yellow, Colors.grey, Colors.orangeAccent];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: colors.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius,
                    image: DecorationImage(
                      image:
                          AssetImage('assets/slides/slider_${index + 1}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: DotsIndicator(
              controller: _controller,
              itemCount: colors.length,
              onPageSelected: (int page) {
                // _controller.animateToPage(
                //   page,
                //   duration: _kDuration,
                //   curve: _kCurve,
                // );
              },
            ))
      ],
    );
  }
}
