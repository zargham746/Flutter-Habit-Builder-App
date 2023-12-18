import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/views/widgets/onboarding_description.dart';
import 'package:flutter_habit_builder_app/views/widgets/onboarding_image.dart';
import 'package:flutter_habit_builder_app/views/widgets/onboarding_title.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OnboardingColumn extends StatelessWidget {
  final String title;
  final String imageUrl;
  const OnboardingColumn({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 600),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: ScaleAnimation(
              child: widget,
            ),
          ),
          children: [
            OnboardingTitle(
              title: title,
            ),
            OnbaoardingImage(
              imageUrl: imageUrl,
            ),
            const OnboardingDescription()
          ],
        ),
      ),
    );
  }
}
