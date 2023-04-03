// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:fundcheck/src/shared/res/res.dart';

class AddIconBudget extends StatelessWidget {
  final String image;
  final int activeIndex;
  const AddIconBudget({
    Key? key,
    required this.activeIndex,
    required this.image,
  }) : super(key: key);

  static final List<IconRowTile> getIconTile = [
    IconRowTile(
      icon: FIcons.smileyIcon,
      index: 0,
    ),
    IconRowTile(
      icon: FIcons.ballIcon,
      index: 1,
    ),
    IconRowTile(
      icon: FIcons.bulbIcon,
      index: 2,
    ),
    IconRowTile(
      icon: FIcons.handIcon,
      index: 3,
    ),
    IconRowTile(
      icon: FIcons.leafIcon,
      index: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        activeIndex != activeIndex;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: 
             BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: FColors.primaryYellow, width: 3),
                color: FColors.primaryGrey.withOpacity(0.1),
              ),
        child: Image.asset(image),
      ),
    );
  }
}

class IconRowTile {
  String icon;
  int index;
  IconRowTile({
    required this.icon,
    required this.index,
  });
}
