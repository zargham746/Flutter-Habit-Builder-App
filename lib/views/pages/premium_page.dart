import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_button.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:go_router/go_router.dart';

import '../widgets/premium_row.dart';
import '../widgets/subscription_row.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStrings.appLightYellowColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CustomIconButton(
            onTap: () {
              context.pop(true);
            },
            iconUrl: AppStrings.backIcon,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Premium',
          style: bodyStyle.copyWith(
            letterSpacing: 0,
            fontSize: 18.spMax,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.w,
              ),
              image: const DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage(
                  AppStrings.onBoarding1,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.w,
              ).copyWith(
                right: 150.w,
                left: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '60% off your Upgrade',
                    style: headerStyle.copyWith(
                        fontSize: 20.sp, color: AppStrings.appYellowColor),
                  ),
                  Text(
                    'Expires\t\tin',
                    style: bodyStyle.copyWith(
                      color: AppStrings.appPurpleColor.withAlpha(50),
                      letterSpacing: 0,
                      fontSize: 16.sp,
                      wordSpacing: -3,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TimerCountdown(
                    enableDescriptions: false,
                    timeTextStyle: bodyStyle.copyWith(
                      color: AppStrings.appPurpleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                    format: CountDownTimerFormat.hoursMinutesSeconds,
                    endTime: DateTime.now().add(
                      const Duration(
                        hours: 14,
                        minutes: 12,
                        seconds: 05,
                      ),
                    ),
                    onEnd: () {
                      if (kDebugMode) {
                        print("Timer finished");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Unlock Monumental Habits",
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(
                    color: AppStrings.appPurpleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  thickness: 1.w,
                  color: AppStrings.appLightYellowColor,
                ),
                const PremiumRow(
                  title: "Unlimited Habits",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  thickness: 1.w,
                  color: AppStrings.appLightYellowColor,
                ),
                const PremiumRow(
                  title: "Access to All Courses",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  thickness: 1.w,
                  color: AppStrings.appLightYellowColor,
                ),
                const PremiumRow(
                  title: "Access to All Avatar Illustrations",
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const SubscriptionRow(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: CustomButton(
                onpress: () {},
                text: "Subscribe Now",
                backgroundColor: AppStrings.appYellowColor),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppStrings.secureIcon,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Secured with Google Play.Cancel Anytime.",
                style: bodyStyle.copyWith(
                  color: AppStrings.appPurpleColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "Restore Purchase",
              textAlign: TextAlign.center,
              style: bodyStyle.copyWith(
                color: AppStrings.appYellowColor,
                decoration: TextDecoration.underline,
                decorationColor: AppStrings.appYellowColor,
                decorationThickness: 2.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Terms of Service",
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(
                    color: AppStrings.appPurpleColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppStrings.appPurpleColor,
                    decorationThickness: 2.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'and',
                style: bodyStyle.copyWith(
                  color: Colors.grey.shade500,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey.shade500,
                  decorationThickness: 2.w,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Privacy Policy",
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(
                    color: AppStrings.appPurpleColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppStrings.appPurpleColor,
                    decorationThickness: 2.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
