import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconWidget extends StatelessWidget {
  final Color backgroundColor;
  final String imageUrl;

  const CustomIconWidget({
    Key? key,
    required this.backgroundColor,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      padding: EdgeInsets.all(
        10.w,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        imageUrl,
      ),
    );
  }
}
