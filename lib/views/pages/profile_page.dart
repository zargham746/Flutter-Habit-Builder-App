// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/models/profile_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../res/strings.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_icon_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedItem = 'This Week';
  List<String> items = [
    'This Week',
    'Last 2 Weeks',
    'Last Month',
  ];
  List<ProfileModel> tasksCompleted = [
    ProfileModel(
      completionPercentage: 7.0,
      date: "6/14",
    ),
    ProfileModel(
      completionPercentage: 0.0,
      date: "6/15",
    ),
    ProfileModel(
      completionPercentage: 6.0,
      date: "6/16",
    ),
    ProfileModel(
      completionPercentage: 4.0,
      date: "6/17",
    ),
    ProfileModel(
      completionPercentage: 9.0,
      date: "6/18",
    ),
    ProfileModel(
      completionPercentage: 10.0,
      date: "Today",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStrings.appLightYellowColor,
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CustomIconButton(
            onTap: () {
              context.pop(true);
            },
            iconUrl: AppStrings.backIcon,
          ),
        ),
        title: Text(
          "Profile",
          style: bodyStyle.copyWith(
            letterSpacing: 0,
            fontSize: 18.spMax,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CustomIconButton(
            iconUrl: AppStrings.editIcon,
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300.h,
            width: 374.w,
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ).copyWith(
              top: 20.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 28.r,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: const AssetImage(
                          AppStrings.userImage,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Marilyn\tAminoff",
                            style: bodyStyle.copyWith(
                              color: AppStrings.appPurpleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              letterSpacing: 0,
                              wordSpacing: 0,
                            ),
                          ),
                          Text(
                            "Name",
                            style: bodyStyle.copyWith(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              letterSpacing: 0,
                              wordSpacing: -3,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 8.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                          border: Border.all(
                            width: 1.w,
                            color: Colors.grey.withAlpha(50),
                          ),
                        ),
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(
                            20.r,
                          ),
                          isDense: true,
                          alignment: Alignment.bottomCenter,
                          underline: Container(),
                          value: selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedItem = newValue!;
                            });
                          },
                          items: items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.h,
                  color: AppStrings.appLightYellowColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total Work Hours
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Work Hours",
                                style: bodyStyle.copyWith(
                                  color: Colors.grey.shade300,
                                  fontSize: 12.sp,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                "18",
                                style: headerStyle.copyWith(
                                  fontSize: 24.sp,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomIconWidget(
                            backgroundColor:
                                AppStrings.appYellowColor.withAlpha(50),
                            imageUrl: AppStrings.watchIcon,
                          ),
                        ],
                      ),
                      //Vertical Divider
                      VerticalDivider(
                        thickness: 1.w,
                        color: AppStrings.appLightYellowColor,
                      ),
                      // Tasks Completed
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Task Completed",
                                style: bodyStyle.copyWith(
                                  color: Colors.grey.shade300,
                                  fontSize: 12.sp,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                "12",
                                style: headerStyle.copyWith(
                                  fontSize: 24.sp,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomIconWidget(
                            backgroundColor:
                                AppStrings.appPaleBlueColor.withAlpha(50),
                            imageUrl: AppStrings.flagIcon,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.h,
                  color: AppStrings.appLightYellowColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: tasksCompleted.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: 5.w,
                          ),
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 28.r,
                                lineWidth: 5.w,
                                percent:
                                    tasksCompleted[index].completionPercentage /
                                        10,
                                center: Text(
                                  tasksCompleted[index]
                                      .completionPercentage
                                      .toStringAsFixed(
                                        0,
                                      ),
                                  style: bodyStyle.copyWith(
                                    color: AppStrings.appPurpleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: Colors.grey.shade300,
                                progressColor: tasksCompleted[index]
                                            .completionPercentage ==
                                        0
                                    ? Colors.redAccent
                                    : AppStrings.appPurpleColor,
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 1300,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                tasksCompleted[index].date,
                                style: bodyStyle.copyWith(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          // Billing Methods Container
          ProfileContainer(
            imageUrl: AppStrings.billingMethodsIcon,
            title: "Billing Methods",
            onpress: () {},
            rowText: "",
          ),
          SizedBox(
            height: 10.h,
          ),
          // Longest Streak Container
          ProfileContainer(
            imageUrl: AppStrings.longestStreakIcon,
            title: "Longest Streak",
            onpress: () {},
            rowText: "20",
          ),
          SizedBox(
            height: 20.h,
          ),
          TextButton(
            onPressed: () {
              context.push(
                context.namedLocation("PremiumPage"),
              );
            },
            child: Text(
              "Subscribe to Premium",
              style: bodyStyle.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppStrings.appYellowColor,
                decorationThickness: 2.h,
                fontWeight: FontWeight.bold,
                decorationStyle: TextDecorationStyle.solid,
                color: AppStrings.appYellowColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final String rowText;
  final String imageUrl;
  const ProfileContainer({
    this.rowText = "",
    required this.imageUrl,
    required this.title,
    required this.onpress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                children: [
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                      color: AppStrings.appPurpleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                rowText,
                style: bodyStyle.copyWith(
                  color: AppStrings.appPurpleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              IconButton(
                onPressed: onpress,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: AppStrings.appPurpleColor,
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
