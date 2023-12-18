import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/strings.dart';

class SubIconRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const SubIconRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppStrings.appYellowColor,
            size: 18.sp,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            text,
            style: bodyStyle.copyWith(
              fontSize: 12.sp,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
