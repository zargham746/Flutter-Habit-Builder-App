import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/date_model.dart';
import '../../res/strings.dart';

class HabitsRow extends StatelessWidget {
  const HabitsRow({
    super.key,
    required this.dateModel,
  });

  final List<DateModel> dateModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: Text(
            "Habits",
            style: bodyStyle.copyWith(
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 65.w,
        ),
        SizedBox(
          height: 50.h,
          child: ListView.builder(
              itemCount: dateModel.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 50.h,
                  width: 50.w,
                  margin: EdgeInsets.only(
                    right: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateModel[index].getFormattedDayName(),
                        style: TextStyle(
                            fontSize: 10.spMax,
                            fontWeight: FontWeight.bold,
                            color: AppStrings.appPurpleColor.withAlpha(50)),
                      ),
                      Text(
                        dateModel[index].getFormatedDayNumber(),
                        style: bodyStyle.copyWith(
                          color: AppStrings.appPurpleColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
