// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_habit_builder_app/res/strings.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final Color backgroundColor;
  final String text;
  const CustomButton(
      {Key? key,
      required this.onpress,
      required this.text,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          60.h,
        ),
      ),
      onPressed: onpress,
      child: Text(
        text,
        style: bodyStyle.copyWith(
          color: AppStrings.appPurpleColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
