import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class CollectionCategoary extends StatelessWidget {
  final String iconPath;
  final String categoary;
  const CollectionCategoary(
      {Key? key, required this.categoary, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Color(0xFF364550),
              borderRadius: BorderRadius.circular(18),
            ),
            child: SvgPicture.asset(
              iconPath,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            categoary,
            style: kText14.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
