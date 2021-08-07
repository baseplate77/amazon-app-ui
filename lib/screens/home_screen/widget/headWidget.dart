import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'collection_categoary.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    Key? key,
    this.showMenu = true,
    required this.onPressed,
  }) : super(key: key);

  final bool showMenu;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
          color: Color(0xFF202E41),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          )),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onPressed,
                      child: SvgPicture.asset(
                        "assets/images/menu.svg",
                        color: Colors.white,
                        // width: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: SvgPicture.asset(
                        "assets/images/logo.svg",
                        width: 100,
                        height: 35,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: kBorderRadius),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text(
                      "What are you looking for",
                      style: kText16,
                    ),
                    Spacer(),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.camera_enhance),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.mic)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Text(
                  "Best Collection",
                  style: kText24.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              SizedBox(
                // width: 200,
                height: 100,
                child: ListView(
                  padding: EdgeInsets.only(left: 12),
                  scrollDirection: Axis.horizontal,
                  children: [
                    CollectionCategoary(
                      iconPath: 'assets/images/smartphone.svg',
                      categoary: "Mobiles",
                    ),
                    CollectionCategoary(
                      iconPath: "assets/images/clothing.svg",
                      categoary: "Clothing",
                    ),
                    CollectionCategoary(
                      iconPath: "assets/images/television.svg",
                      categoary: "Electronics",
                    ),
                    CollectionCategoary(
                      iconPath: "assets/images/gamepad.svg",
                      categoary: "Games",
                    ),
                    CollectionCategoary(
                      iconPath: "assets/images/credit-card.svg",
                      categoary: "Gift Card",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
