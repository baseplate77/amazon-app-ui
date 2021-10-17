import 'package:flutter/widgets.dart';

import 'widget/product_tab.dart';

List<Widget> productList = [
  const ProductTab(
    title: 'Iphone',
    price: '69,990',
    image: 'assets/products/product_1.jpg',
  ),
  const ProductTab(
    title: 'Versace Eros',
    price: '2,490',
    image: 'assets/products/product_2.jpeg',
  ),
  const ProductTab(
    title: 'Curology Cleaner',
    price: '1,990',
    image: 'assets/products/product_3.jpeg',
  ),
  const ProductTab(
    title: 'Airpods Pro',
    price: '22,490',
    image: 'assets/products/product_4.jpeg',
  ),
  const ProductTab(
    title: 'Canon Lens',
    price: '8,490',
    image: 'assets/products/product_5.jpeg',
  ),
];
