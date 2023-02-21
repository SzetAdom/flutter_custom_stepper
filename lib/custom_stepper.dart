library custom_stepper;

import 'package:custom_stepper/custom_stepper_step.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper(
      {required this.steps,
      required this.activeIndex,
      required this.onStepTapped,
      this.isVertical = true,
      super.key});

  final List<CustomStepperStep> steps;
  final int activeIndex;
  final bool isVertical;
  final Function(int index) onStepTapped;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Column(
        children: [for (var i = 0; i < steps.length; i++) getCurrentItem(i)],
      );
    }
    return Container();
  }

  Widget getCurrentItem(int i) {
    if (activeIndex == i) {
      return Column(
        children: [
          Row(
            children: [
              steps[i].activeIcon ?? steps[i].icon ?? indexIcon(i),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  steps[i].activeTitle ?? steps[i].title,
                  steps[i].activeSubTitle ?? steps[i].subTitle ?? Container(),
                ],
              ),
            ],
          ),
          steps[i].child,
        ],
      );
    } else {
      return Row(
        children: [
          GestureDetector(
              onTap: () => onStepTapped(i),
              child: steps[i].icon ?? indexIcon(i)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              steps[i].title,
              steps[i].subTitle ?? Container(),
            ],
          ),
        ],
      );
    }
  }

  Widget indexIcon(int index) {
    return Container(
      width: 40,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Text((index + 1).toString()),
    );
  }
}
