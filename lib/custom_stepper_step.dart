import 'package:flutter/material.dart';

class CustomStepperStep {
  Widget? activeTitle;
  Widget? activeSubTitle;
  Widget? activeIcon;

  Widget title;
  Widget? subTitle;
  Widget? icon;

  Widget child;

  CustomStepperStep({
    this.activeTitle,
    this.activeSubTitle,
    this.subTitle,
    this.icon,
    this.activeIcon,
    required this.title,
    required this.child,
  });
}
