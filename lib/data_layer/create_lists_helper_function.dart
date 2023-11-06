import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/data.dart';

void createLists(List<MapItem> firstList, List<MapItem> secondList,
    List<String> categoryList) {
  categoryList.add('grocery');
  categoryList.add('mall');
  categoryList.add('hospital');
  categoryList.add('park');
  firstList.add(MapItem(
      icon: const Icon(
        Icons.fort_outlined,
        color: Color(0xffF4C871),
      ),
      color: const Color(0xffF4C871),
      textLabel: 'sights'));
  firstList.add(MapItem(
      icon: const Icon(
        Icons.hotel,
        color: Color(
          0xffA3C3DB,
        ),
      ),
      color: const Color(
        0xffA3C3DB,
      ),
      textLabel: 'hotels'));
  firstList.add(MapItem(
      icon: const Icon(
        Icons.nightlife,
        color: Color(0xffC75E6B),
      ),
      color: const Color(0xffC75E6B),
      textLabel: 'nightLife'));
  secondList.add(MapItem(
      icon: const Icon(
        Icons.restaurant,
        color: Color(0xffC2807E),
      ),
      color: const Color(0xffC2807E),
      textLabel: 'restaurants'));
  secondList.add(MapItem(
      icon: Image.asset('assets/images/Other.png',
          color: const Color(0xffF3F0E6)),
      color: const Color(0xffF3F0E6),
      textLabel: 'other'));
}
