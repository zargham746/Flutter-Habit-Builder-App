// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/views/widgets/onboarding_column.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 80.h),
        child: Column(
          children: [
            SizedBox(
              height: 619.h,
              width: double.infinity,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 3);
                },
                children: const [
                  OnboardingColumn(
                    title: "WELCOME TO\nMONUMENTAL HABITS",
                    imageUrl: AppStrings.onBoarding1,
                  ),
                  OnboardingColumn(
                    title: "CREATE NEW\nHABITS EASILY",
                    imageUrl: AppStrings.onBoarding2,
                  ),
                  OnboardingColumn(
                    title: "KEEP TRACK OF YOUR\nPROGRESS",
                    imageUrl: AppStrings.onBoarding3,
                  ),
                  OnboardingColumn(
                    title: "JOIN A SUPPORTIVE\nCOMMUNITY",
                    imageUrl: AppStrings.onBoarding4,
                  ),
                ],
              ),
            ),
            isLastPage
                ? Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: CustomButton(
                      backgroundColor: const Color(0xffFDA758),
                      text: "GET STARTED",
                      onpress: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool(
                          'ShowLogin',
                          true,
                        );
                        // storeOnBoardInfo();
                        context.pushReplacementNamed(
                          "LoginPage",
                        );
                      },
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ).copyWith(
                      top: 40.h,
                    ),
                    height: 80.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => controller.jumpToPage(3),
                          child: Text(
                            'Skip',
                            style: bodyStyle.copyWith(
                              color: AppStrings.appPurpleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            onDotClicked: (index) => controller.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            ),
                            effect: ScaleEffect(
                              dotHeight: 11.h,
                              dotWidth: 11.w,
                              activeDotColor: AppStrings.appPurpleColor,
                              dotColor: const Color(0xffFDA758),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                          child: Text(
                            'Next',
                            style: bodyStyle.copyWith(
                              color: AppStrings.appPurpleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
