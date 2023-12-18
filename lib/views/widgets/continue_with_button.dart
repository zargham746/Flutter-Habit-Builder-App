import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/strings.dart';

class ContinueWithButton extends StatelessWidget {
  final String iconUrl;
  final String text;
  final VoidCallback onpress;
  final double width;
  const ContinueWithButton({
    Key? key,
    required this.width,
    required this.iconUrl,
    required this.text,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: width,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconUrl,
              height: 23.h,
              width: 23.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              text,
              style: bodyStyle.copyWith(
                color: AppStrings.appPurpleColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
