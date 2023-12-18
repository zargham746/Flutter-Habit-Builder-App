import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/strings.dart';

class SubscriptionRow extends StatelessWidget {
  const SubscriptionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Basic Plan
          Container(
            height: 135.h,
            width: 119.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "\$19.00",
                  style: bodyStyle.copyWith(
                    color: AppStrings.appYellowColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Text(
                    "6-month plan for 39.99 usd",
                    textAlign: TextAlign.center,
                    style: bodyStyle.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.h,
                  color: AppStrings.appLightYellowColor,
                ),
                Text(
                  "Monthly",
                  style: bodyStyle.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Standard Plan
          Container(
            height: 154.h,
            width: 120.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 120.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppStrings.appYellowColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Most Popular",
                      textAlign: TextAlign.center,
                      style: bodyStyle.copyWith(
                        color: AppStrings.appPurpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "\$19.00",
                  style: bodyStyle.copyWith(
                    color: AppStrings.appYellowColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Text(
                    "6-month plan for 39.99 usd",
                    textAlign: TextAlign.center,
                    style: bodyStyle.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.h,
                  color: AppStrings.appLightYellowColor,
                ),
                Text(
                  "Yearly",
                  style: bodyStyle.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          //Premium Plan
          Container(
            height: 135.h,
            width: 119.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "\$19.00",
                  style: bodyStyle.copyWith(
                    color: AppStrings.appYellowColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Text(
                    "6-month plan for 39.99 usd",
                    textAlign: TextAlign.center,
                    style: bodyStyle.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.h,
                  color: AppStrings.appLightYellowColor,
                ),
                Text(
                  "Lifetime",
                  style: bodyStyle.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
