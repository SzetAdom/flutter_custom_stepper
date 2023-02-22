library custom_stepper;

import 'package:custom_stepper/custom_stepper_step.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper(
      {required this.steps,
      required this.activeIndex,
      required this.onStepTapped,
      required this.iconWidth,
      required this.separatorHeight,
      required this.iconTitleGap,
      this.isVertical = true,
      this.drawLineWhenActive = true,
      super.key});

  final List<CustomStepperStep> steps;
  final int activeIndex;
  final bool isVertical;
  final Function(int index) onStepTapped;
  final double iconWidth;
  final double separatorHeight;
  final double iconTitleGap;
  final bool drawLineWhenActive;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Column(
        children: [
          for (int i = 0; i < activeIndex; i++)
            Column(
              children: [
                getInactiveListItem(i),
                getInactiveSeparator(i),
              ],
            ),
          IntrinsicHeight(child: getActiveListItem(activeIndex)),
          if (activeIndex < steps.length - 1)
            for (int i = activeIndex + 1; i < steps.length; i++)
              Column(
                children: [
                  getInactiveListItem(i),
                  getInactiveSeparator(i),
                ],
              ),
        ],
      );
    }
    return Container();
  }

  Widget getActiveListItem(int i) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getActiveIcon(),
            SizedBox(
              width: iconTitleGap,
            ),
            Expanded(child: getActiveTitle())
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
                width: iconWidth + iconTitleGap,
                child: getInactiveSeparator(activeIndex)),
            Expanded(child: steps[activeIndex].child)
          ],
        )
      ],
    );
  }

  Widget getActiveTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        steps[activeIndex].activeTitle ?? steps[activeIndex].title,
        steps[activeIndex].activeSubTitle ??
            steps[activeIndex].subTitle ??
            Container(),
      ],
    );
  }

  Widget getActiveIcon() {
    return SizedBox(
        width: iconWidth,
        child: steps[activeIndex].activeIcon ??
            steps[activeIndex].icon ??
            Container());
  }

  Widget getInactiveSeparator(int i) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: iconWidth / 2),
        width: 1,
        height: separatorHeight,
        color: i != steps.length - 1 ? Colors.grey : Colors.transparent,
      ),
    );
  }

  Widget getInactiveListItem(int i) {
    return GestureDetector(
      onTap: () => onStepTapped(i),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getInactiveIconByIndex(i),
          SizedBox(width: iconTitleGap),
          Expanded(child: getInactiveTitleByIndex(i))
        ],
      ),
    );
  }

  Widget getInactiveIconByIndex(int i) {
    return SizedBox(width: iconWidth, child: steps[i].icon ?? Container());
  }

  Widget getInactiveTitleByIndex(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        steps[i].title,
        steps[i].subTitle ?? Container(),
      ],
    );
  }
}
