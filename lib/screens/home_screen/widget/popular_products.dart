import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../product_data.dart';
import 'product_page_view.dart';

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
              // list of all products
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
