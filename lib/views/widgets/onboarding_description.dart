import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';

class OnboardingDescription extends StatelessWidget {
  const OnboardingDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'WE CAN ',
              style: bodyStyle.copyWith(
                color: AppStrings.appPurpleColor,
              ),
            ),
            TextSpan(
              text: 'HELP YOU ',
              style: bodyStyle.copyWith(
                color: const Color(0xffFDA758),
              ),
            ),
            TextSpan(
              text: 'TO BE A BETTER\n',
              style: bodyStyle.copyWith(
                color: AppStrings.appPurpleColor,
              ),
            ),
            TextSpan(
              text: 'VERSION OF ',
              style: bodyStyle.copyWith(
                color: AppStrings.appPurpleColor,
              ),
            ),
            TextSpan(
              text: 'YOURSELF',
              style: bodyStyle.copyWith(
                color: const Color(0xffFDA758),
              ),
            ),
          ],
        ));
  }
}
