import 'package:flutter/material.dart';
import 'package:safee/styles/style.dart';

class Indicator extends StatelessWidget {
  const Indicator(
      {super.key, required this.positionIndex, required this.currentIndex});
  final int positionIndex;
  final ValueNotifier<int> currentIndex;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, index, child) {
        return Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
              border: Border.all(
                  color: index == positionIndex ? primaryOrange : lightGray),
              color: index == positionIndex ? primaryOrange : lightGray,
              borderRadius: BorderRadius.circular(100)),
        );
      },
      valueListenable: currentIndex,
    );
  }
}
