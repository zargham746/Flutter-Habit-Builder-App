import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/strings.dart';

class GeneralContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onPress;
  const GeneralContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppStrings.appLightYellowColor,
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    imageUrl,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                      color: AppStrings.appPurpleColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: bodyStyle.copyWith(
                      color: Colors.grey.shade300,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: onPress,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18.sp,
              color: AppStrings.appPurpleColor,
            ),
          ),
        ],
      ),
    );
  }
}
