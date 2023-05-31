import 'package:flutter/material.dart';
import 'package:shelf_life/constants/icons.dart';

class SelectFeatureModel {
  final String image;
  final String name;
  bool value;
  final List<Color> colors;
  final Color iconColor;
  final String unselectedIcon;
  int? index;

  SelectFeatureModel({
    required this.image,
    this.index,
    required this.name,
    this.value = false,
    required this.colors,
    required this.iconColor,
    required this.unselectedIcon,
  });
}

List<SelectFeatureModel> selectFeatureList = [
  SelectFeatureModel(
    index: 0,
    image: IconClass.friendly,
    name: 'Friendly Staff',
    colors: [
      const Color(0xffFDD62F).withOpacity(.33),
      const Color(0xffFDD62F),
    ],
    iconColor: const Color(0xffFDD62F),
    unselectedIcon: 'assets/icons/unselectFriendly.png',
  ),
  SelectFeatureModel(
    index: 1,
    image: IconClass.delicious,
    name: 'Delicious Food',
    colors: [
      const Color(0xffF6842B).withOpacity(.33),
      const Color(0xffF6842B),
    ],
    iconColor: const Color(0xffD05421),
    unselectedIcon: 'assets/icons/unselectedDelicious.png',
  ),
  SelectFeatureModel(
    index: 2,
    image: IconClass.quickpickup,
    name: 'Quick Pickup',
    colors: [
      const Color(0xff4D38D3).withOpacity(.33),
      const Color(0xff6951FF),
    ],
    iconColor: const Color(0xff4D38D3),
    unselectedIcon: 'assets/icons/unselectedquick.png',
  ),
  SelectFeatureModel(
    index: 3,
    image: IconClass.bestQuality,
    name: 'Best Quality',
    colors: [
      const Color(0xff8EC140).withOpacity(.33),
      const Color(0xff83AD3A),
    ],
    iconColor: const Color(0xff738E43),
    unselectedIcon: 'assets/icons/unselectedquality.png',
  ),
];
