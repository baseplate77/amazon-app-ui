import 'package:amazonui/screens/home_screen/slide_data.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'dot_indicator.dart';

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
                      image: AssetImage(slideImagePath[index]),
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
