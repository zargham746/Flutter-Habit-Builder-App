import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbaoardingImage extends StatelessWidget {
  final String imageUrl;
  const OnbaoardingImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: 400.w,
      child: Image(
        image: AssetImage(
          imageUrl,
        ),
      ),
    );
  }
}
