import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/models/date_model.dart';
import 'package:flutter_habit_builder_app/models/habit_completion_model.dart';
import 'package:flutter_habit_builder_app/models/habit_model.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../widgets/habits_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Container container = Container();
    final List<DateModel> dateModel = [
      for (int i = -5; i < 1; i++)
        DateModel(
          DateTime(2023, 9, 10 + i),
        ),
    ];
    final List<HabitModel> habitModel = [
      HabitModel(
          habitDate: DateModel(
            DateTime.now(),
          ),
          habitName: "Read A Book",
          habitProgress: [
            HabitCompletionModel(inProgress: true),
            HabitCompletionModel(notStarted: true),
            HabitCompletionModel(completed: true),
            HabitCompletionModel(completed: true),
            HabitCompletionModel(inProgress: true),
            HabitCompletionModel(completed: true),
          ]),
      HabitModel(
          habitDate: DateModel(
            DateTime.now(),
          ),
          habitName: "Exercise",
          habitProgress: [
            HabitCompletionModel(completed: true),
            HabitCompletionModel(completed: true),
            HabitCompletionModel(inProgress: true),
            HabitCompletionModel(completed: true),
            HabitCompletionModel(inProgress: true),
            HabitCompletionModel(notStarted: true),
          ]),
      HabitModel(
        habitDate: DateModel(
          DateTime.now(),
        ),
        habitName: "Wake Up Early",
        habitProgress: [
          HabitCompletionModel(completed: true),
          HabitCompletionModel(inProgress: true),
          HabitCompletionModel(completed: true),
          HabitCompletionModel(inProgress: true),
          HabitCompletionModel(completed: true),
          HabitCompletionModel(inProgress: true),
          HabitCompletionModel(notStarted: true),
        ],
      ),
    ];
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: AppStrings.appLightYellowColor,
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            AppStrings.homeBackground,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 10.w,
            ),
            child: CustomIconButton(
              onTap: () {},
              iconUrl: AppStrings.menuIcon,
            ),
          ),
          title: Text(
            "Homepage",
            style: bodyStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.spMax,
              letterSpacing: 0,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 10.w,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: const AssetImage(
                  AppStrings.userImage,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: AnimationLimiter(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              primary: true,
              scrollDirection: Axis.vertical,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        20.w,
                      ),
                      image: const DecorationImage(
                        alignment: Alignment.centerRight,
                        image: AssetImage(
                          AppStrings.onBoarding1,
                        ),
                      ),
                    ),
                    child: Wrap(
                      runAlignment: WrapAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      spacing: 8.w,
                      runSpacing: 5.0,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.w,
                          ).copyWith(
                            right: 150.w,
                            left: 20.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'We first make our habits and then our habits makes us.',
                                style: headerStyle.copyWith(
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                '\n-Anonymous',
                                style: bodyStyle.copyWith(
                                    color: AppStrings.appPurpleColor
                                        .withAlpha(50)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      left: 30.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HabitsRow(dateModel: dateModel),
                        SizedBox(
                          height: 15.h,
                        ),
                        // Read a Book Row
                        InkWell(
                          onTap: () {
                            context.push(
                              context.namedLocation(
                                "HabitDetailsPage",
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 70.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      20.r,
                                    ),
                                    bottomLeft: Radius.circular(
                                      20.r,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  habitModel[0].habitName,
                                  style: bodyStyle.copyWith(
                                    fontSize: 14.spMax,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Container(
                                height: 70.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      20.r,
                                    ),
                                    bottomRight: Radius.circular(
                                      20.r,
                                    ),
                                  ),
                                ),
                                child: ListView.builder(
                                    padding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 10.h,
                                      bottom: 10.h,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: dateModel.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      if (habitModel[0]
                                              .habitProgress[index]
                                              .completed ==
                                          true) {
                                        container = habitCompletedContainer;
                                      } else if (habitModel[0]
                                              .habitProgress[index]
                                              .inProgress ==
                                          true) {
                                        container = habitInProgressContainer;
                                      } else if (habitModel[0]
                                              .habitProgress[index]
                                              .notStarted ==
                                          true) {
                                        container = habitnotStartedContainer;
                                      }
                                      return container;
                                    }),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Exercise Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 70.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20.r,
                                  ),
                                  bottomLeft: Radius.circular(
                                    20.r,
                                  ),
                                ),
                              ),
                              child: Text(
                                habitModel[1].habitName,
                                style: bodyStyle.copyWith(
                                  fontSize: 14.spMax,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    20.r,
                                  ),
                                  bottomRight: Radius.circular(
                                    20.r,
                                  ),
                                ),
                              ),
                              child: ListView.builder(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                    top: 10.h,
                                    bottom: 10.h,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: dateModel.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    if (habitModel[1]
                                            .habitProgress[index]
                                            .completed ==
                                        true) {
                                      container = habitCompletedContainer;
                                    } else if (habitModel[1]
                                            .habitProgress[index]
                                            .inProgress ==
                                        true) {
                                      container = habitInProgressContainer;
                                    } else if (habitModel[1]
                                            .habitProgress[index]
                                            .notStarted ==
                                        true) {
                                      container = habitnotStartedContainer;
                                    }
                                    return container;
                                  }),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Wake Up Early Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 70.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20.r,
                                  ),
                                  bottomLeft: Radius.circular(
                                    20.r,
                                  ),
                                ),
                              ),
                              child: Text(
                                habitModel[2].habitName,
                                style: bodyStyle.copyWith(
                                  fontSize: 14.spMax,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    20.r,
                                  ),
                                  bottomRight: Radius.circular(
                                    20.r,
                                  ),
                                ),
                              ),
                              child: ListView.builder(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                    top: 10.h,
                                    bottom: 10.h,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: dateModel.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    if (habitModel[2]
                                            .habitProgress[index]
                                            .completed ==
                                        true) {
                                      container = habitCompletedContainer;
                                    } else if (habitModel[2]
                                            .habitProgress[index]
                                            .inProgress ==
                                        true) {
                                      container = habitInProgressContainer;
                                    } else if (habitModel[2]
                                            .habitProgress[index]
                                            .notStarted ==
                                        true) {
                                      container = habitnotStartedContainer;
                                    }
                                    return container;
                                  }),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
