import 'package:amazonui/constants.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double kNavFieldSperation = 16;
    final TextStyle kNavFieldStyle = kText16;
    return Container(
      width: double.infinity,
      color: Color(0xFFEEEFEE),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: ,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/images/profile.jpeg",
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Hello,",
                  style: kText16,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Alex Smith",
                  style: kText24,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 1,
                  color: Colors.grey.withOpacity(0.35),
                ),
                // nav field
                Text(
                  "Home",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Shop by Category",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Your Orders",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Buy Again",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Your Wishlist",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Your Account",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Amazon Pay",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Prime",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Sell on Amazon",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Setting",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Text(
                  "Support",
                  style: kNavFieldStyle,
                ),
                SizedBox(
                  height: kNavFieldSperation,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 1,
                  color: Colors.grey.withOpacity(0.35),
                ),
                Container(
                  width: 120,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xFFDADADB), borderRadius: kBorderRadius),
                  child: Text(
                    "Log Out",
                    style: kText16.copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
