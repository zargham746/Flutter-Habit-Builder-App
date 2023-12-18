import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String iconUrl;
  const CustomIconButton({
    Key? key,
    required this.onTap,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          10.w,
        ),
        margin: EdgeInsets.only(
          right: 10.w,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Image.asset(
          iconUrl,
        ),
      ),
    );
  }
}
