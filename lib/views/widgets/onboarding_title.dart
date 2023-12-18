import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingTitle extends StatelessWidget {
  final String title;
  const OnboardingTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: headerStyle.copyWith(letterSpacing: -3, height: 1.2.h),
    );
  }
}
