// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_habit_builder_app/models/habit_completion_model.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';

import '../widgets/sub_icon_row.dart';

class HabitDetailsPage extends StatefulWidget {
  const HabitDetailsPage({super.key});

  @override
  State<HabitDetailsPage> createState() => _HabitDetailsPageState();
}

class _HabitDetailsPageState extends State<HabitDetailsPage> {
  @override
  Widget build(BuildContext context) {
    void showMyDialog(BuildContext context) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomIconButton(
                      onTap: () {
                        context.pop(true);
                      },
                      iconUrl: AppStrings.closeIcon,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 366.h,
                  width: 350.w,
                  child: Image.asset(
                    AppStrings.swirlyImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'CONGRATULATIONS!',
                  textAlign: TextAlign.center,
                  style: headerStyle.copyWith(
                    fontSize: 24.sp,
                    letterSpacing: -3,
                  ),
                ),
                Text(
                  "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(
                    color: AppStrings.appPurpleColor.withAlpha(
                      50,
                    ),
                    fontSize: 16.sp,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  onpress: () {
                    setState(() {
                      isHabitPage = !isHabitPage;
                    });
                    context.pop(true);
                    context.push(
                      context.namedLocation(
                        "AddHabitPage",
                      ),
                    );
                  },
                  text: "Create New Habit",
                  backgroundColor: const Color(0xffFDA758),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  onpress: () {
                    context.pop(true);
                  },
                  text: "Continue",
                  backgroundColor: AppStrings.appLightYellowColor,
                )
              ],
            ),
          );
        },
      );
    }

    final List<int> dayNumbers = [
      for (int i = 0; i < 30; i++) i + 1,
    ];
    final List<HabitCompletionModel> completion = [
      HabitCompletionModel(
        inProgress: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        inProgress: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        inProgress: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        inProgress: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        inProgress: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
      HabitCompletionModel(
        notStarted: true,
      ),
      HabitCompletionModel(
        inProgress: true,
      ),
      HabitCompletionModel(
        completed: true,
      ),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: AppStrings.appLightYellowColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CustomIconButton(
            onTap: () {
              context.pop(true);
            },
            iconUrl: AppStrings.backIcon,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Read A Book",
          style: bodyStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppStrings.appPurpleColor,
            letterSpacing: 0,
          ),
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            iconUrl: AppStrings.editIcon,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.all(
              10.w,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 80.h,
                  child: Image.asset(
                    AppStrings.swirly,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Read A Book",
                      style: bodyStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.spMax,
                        color: AppStrings.appPurpleColor,
                      ),
                    ),
                    const SubIconRow(
                      icon: Icons.notifications_none_outlined,
                      text: "Repeat Everyday",
                    ),
                    const SubIconRow(
                      icon: Icons.repeat,
                      text: "Reminders: 5:00 am",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          // Date Container
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            padding: EdgeInsets.all(
              10.w,
            ),
            height: 450.h,
            width: 374.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppStrings.appPurpleColor,
                        size: 18.sp,
                      ),
                    ),
                    Text(
                      "January",
                      style: bodyStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppStrings.appPurpleColor),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppStrings.appPurpleColor,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SUN",
                        style: bodyStyle.copyWith(
                          fontSize: 12.sp,
                          letterSpacing: 0,
                          color: AppStrings.appPurpleColor.withAlpha(150),
                        ),
                      ),
                      Text(
                        "MON",
                        style: bodyStyle.copyWith(
                          fontSize: 12.sp,
                          letterSpacing: 0,
                          color: AppStrings.appPurpleColor.withAlpha(150),
                        ),
                      ),
                      Text(
                        "TUE",
                        style: bodyStyle.copyWith(
                          letterSpacing: 0,
                          fontSize: 12.sp,
                          color: AppStrings.appPurpleColor.withAlpha(150),
                        ),
                      ),
                      Text(
                        "WED",
                        style: bodyStyle.copyWith(
                          letterSpacing: 0,
                          fontSize: 12.sp,
                          color: AppStrings.appPurpleColor.withAlpha(150),
                        ),
                      ),
                      Text(
                        "THU",
                        style: bodyStyle.copyWith(
                          letterSpacing: 0,
                          fontSize: 12.sp,
                          color: AppStrings.appPurpleColor.withAlpha(150),
                        ),
                      ),
                      Text(
                        "FRI",
                        style: bodyStyle.copyWith(
                          letterSpacing: 0,
                          fontSize: 12.sp,
                          color: AppStrings.appPurpleColor.withAlpha(150),
                        ),
                      ),
                      Text(
                        "SAT",
                        style: bodyStyle.copyWith(
                          fontSize: 12.sp,
                          letterSpacing: 0,
                          color: AppStrings.appPurpleColor.withAlpha(150),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 300.h,
                  width: 350.w,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      primary: false,
                      itemCount: completion.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 8.h,
                        crossAxisCount: 7,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.antiAlias,
                          height: 100.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5.r,
                            ),
                            color: AppStrings.appLightYellowColor.withAlpha(
                              160,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                dayNumbers[index].toString(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              if (completion[index].completed == true)
                                Container(
                                  height: 15.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 5.w,
                                      color: AppStrings.appLightYellowColor,
                                    ),
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(
                                      2.r,
                                    ),
                                  ),
                                ),
                              if (completion[index].inProgress == true)
                                Container(
                                  height: 15.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        2.r,
                                      ),
                                    ),
                                    border: Border.all(
                                      width: 3.w,
                                      color: AppStrings.appLightYellowColor,
                                    ),
                                  ),
                                  child: Image.asset(
                                    AppStrings.habitTriangle,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              if (completion[index].notStarted == true)
                                Container(
                                  height: 15.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    color: AppStrings.appLightYellowColor,
                                    borderRadius: BorderRadius.circular(
                                      2.r,
                                    ),
                                    border: Border.all(
                                      width: 3.w,
                                      color: AppStrings.appLightYellowColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
            width: double.infinity,
            color: AppStrings.appCreamColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Analytics",
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(
                    fontSize: 18.spMax,
                    color: AppStrings.appPurpleColor.withAlpha(
                      150,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        20.r,
                      )),
                  height: 200.h,
                  width: 400.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AnalyticsRow(
                            title: "20 Days",
                            description: "Longest Streak",
                            backgroundColor:
                                AppStrings.appLightYellowColor.withAlpha(
                              160,
                            ),
                            iconUrl: AppStrings.longestStreakIcon,
                          ),
                          AnalyticsRow(
                            title: "0 Days",
                            description: "Current Streak",
                            backgroundColor: AppStrings.appPinkColor.withAlpha(
                              160,
                            ),
                            iconUrl: AppStrings.currentStreakIcon,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AnalyticsRow(
                            title: "98%",
                            description: "Completion Rate",
                            backgroundColor:
                                AppStrings.appLightBlueColor.withAlpha(
                              160,
                            ),
                            iconUrl: AppStrings.completionRateIcon,
                          ),
                          AnalyticsRow(
                            title: "7",
                            description: "Average Easiness\nScore",
                            backgroundColor:
                                AppStrings.appPurpleColor.withAlpha(50),
                            iconUrl: AppStrings.averageScoreIcon,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  backgroundColor: const Color(0xffFDA758),
                  onpress: () {
                    showMyDialog(context);
                  },
                  text: "Mark Habit as Complete",
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  backgroundColor: Colors.white,
                  onpress: () {},
                  text: "Mark Habit as Missed",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AnalyticsRow extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final String iconUrl;
  const AnalyticsRow({
    Key? key,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ).copyWith(
        top: 30.h,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: headerStyle.copyWith(
                  fontSize: 22.sp,
                  letterSpacing: 0,
                ),
              ),
              Text(
                description,
                style: bodyStyle.copyWith(
                  color: AppStrings.appPurpleColor.withAlpha(
                    150,
                  ),
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconUrl,
            ),
          ),
        ],
      ),
    );
  }
}
