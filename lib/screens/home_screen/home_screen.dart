import 'dart:ui';

import 'package:flutter/material.dart';

import 'widget/bottom_bar.dart';
import 'widget/headWidget.dart';
import 'widget/popular_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    this.showMenu = true,
    required this.onPressed,
  }) : super(key: key);

  final bool showMenu;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202F40),
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppBar().preferredSize.height),
            Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.loose,
              children: [
                Container(
                  color: Colors.white,
                  height: 850,
                ),
                HeadWidget(showMenu: showMenu, onPressed: onPressed),
                Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: PopularProduct(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
