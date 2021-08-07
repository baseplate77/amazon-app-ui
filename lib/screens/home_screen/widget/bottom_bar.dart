import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: BottomNavyBar(
        backgroundColor: Color(0xFF202F40),
        itemCornerRadius: 16,
        containerHeight: 65,
        selectedIndex: 0,
        onItemSelected: (index) => print(index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              title: Text(
                "Home",
                textAlign: TextAlign.center,
                style: kText14,
              )),
          BottomNavyBarItem(
              icon: SvgPicture.asset(
                "assets/images/discount.svg",
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              title: Text(
                "Notification",
                style: kText14,
              )),
          BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              title: Text(
                "Notification",
                style: kText14,
              )),
          BottomNavyBarItem(
              icon: SvgPicture.asset(
                "assets/images/shopping-cart.svg",
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              title: Text(
                "Notification",
                style: kText14,
              )),
        ],
      ),
    );
  }
}
