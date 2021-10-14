import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants.dart';

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
