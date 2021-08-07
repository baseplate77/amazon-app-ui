import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants.dart';

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
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const ProductTab(
                  title: 'Iphone',
                  price: '69,990',
                  image: 'assets/images/product_1.jpg',
                ),
                const ProductTab(
                  title: 'Versace Eros',
                  price: '2,490',
                  image: 'assets/images/product_2.jpeg',
                ),
                const ProductTab(
                  title: 'Curology Cleaner',
                  price: '1,990',
                  image: 'assets/images/product_3.jpeg',
                ),
                const ProductTab(
                  title: 'Airpods Pro',
                  price: '22,490',
                  image: 'assets/images/product_4.jpeg',
                ),
                const ProductTab(
                  title: 'Canon Lens',
                  price: '8,490',
                  image: 'assets/images/product_5.jpeg',
                ),
              ],
            ),
          ),
          ProductPageView()
        ],
      ),
    );
  }
}

class ProductTab extends StatefulWidget {
  const ProductTab({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);

  final String title;
  final String image;
  final String price;

  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  bool isFav = false;

  heart() {
    isFav = !isFav;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.cover,
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Colors.black,
              Colors.black12,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.0, 0.5],
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.amber,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: heart,
                child: ClipRRect(
                  borderRadius: kBorderRadius,
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        isFav
                            ? 'assets/images/heart-2-fill.png'
                            : 'assets/images/heart-2.png',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹ ${widget.price}',
                    // "₹ 6599.00",
                    style: kText16.copyWith(color: Color(0xFFFF9800)),
                  ),
                  Text(
                    widget.title,
                    // "iPhone11 (128gb)",
                    style: kText16.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                          AssetImage('assets/images/slider_${index + 1}.png'),
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

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 10.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    bool isSelected = controller.page == index;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: isSelected ? color : color.withOpacity(0.5),
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize,
            height: _kDotSize,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
