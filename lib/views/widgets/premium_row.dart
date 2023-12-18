import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/strings.dart';

class PremiumRow extends StatelessWidget {
  final String title;
  const PremiumRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppStrings.appYellowColor,
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: AppStrings.appPurpleColor,
                size: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: bodyStyle.copyWith(
              color: AppStrings.appPurpleColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
