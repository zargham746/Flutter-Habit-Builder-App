import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/models/courses_model.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  String selectedItem = 'Popular';
  List<String> items = ['Popular', 'Trending', 'Most Liked', 'Top Rated'];
  String filteredItem = 'Reviews';
  List<String> filters = ['Reviews', 'Likes', 'Watch Time', 'Price'];
  List<CoursesModel> courses = [
    CoursesModel(
      courseName:
          "30 Day Journal Challenge - Establish a Habit of Daily Journaling",
      totalLessons: 37,
      totalTime: "2h 41m",
      imageUrl: AppStrings.course1Image,
      isSaved: false,
    ),
    CoursesModel(
      courseName: "Self Help Series: How to Create and Maintain Good Habits",
      totalLessons: 24,
      totalTime: "4h 41m",
      imageUrl: AppStrings.course2Image,
      isSaved: true,
    ),
    CoursesModel(
      courseName:
          "30 Day Journal Challenge - Establish a Habit of Daily Journaling",
      totalLessons: 34,
      totalTime: "2h 41m",
      imageUrl: AppStrings.course1Image,
      isSaved: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
        extendBody: true,
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
            "Courses",
            style: bodyStyle.copyWith(
              fontSize: 18.spMax,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 5.w,
              ),
              child: CustomIconButton(
                onTap: () {},
                iconUrl: AppStrings.searchIcon,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              height: 146.h,
              width: 374.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    AppStrings.splashBackground,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: headerStyle.copyWith(
                        fontSize: 36.sp,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: "HABIT\n",
                        ),
                        TextSpan(
                          text: "COURSES",
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyStyle.copyWith(
                        fontSize: 12.sp,
                        color: AppStrings.appPurpleColor,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: "Find what fascinates you as you explore\n",
                        ),
                        TextSpan(
                          text: "these habit courses.",
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Sort by:",
                        style: bodyStyle.copyWith(),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
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
                            )),
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
                      iconEnabledColor: AppStrings.appYellowColor,
                      style: bodyStyle.copyWith(
                        color: AppStrings.appYellowColor,
                        fontWeight: FontWeight.bold,
                      ),
                      isDense: true,
                      alignment: Alignment.bottomCenter,
                      underline: Container(),
                      value: filteredItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          filteredItem = newValue!;
                        });
                      },
                      items: filters.map((String item) {
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
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                primary: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => context.push(
                      context.namedLocation("CourseDetailsPage"),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Column(
                        children: [
                          Container(
                            height: 220.h,
                            width: 374.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  20.r,
                                ),
                                topRight: Radius.circular(
                                  20.r,
                                ),
                              ),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  courses[index].imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 130.h,
                            width: 374.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  20.r,
                                ),
                                bottomRight: Radius.circular(
                                  20.r,
                                ),
                              ),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                Text(
                                  courses[index].courseName,
                                  style: headerStyle.copyWith(
                                    fontSize: 18.sp,
                                    letterSpacing: 0,
                                    wordSpacing: -3,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          courses[index].totalTime,
                                          style: bodyStyle.copyWith(
                                            color: AppStrings.appPurpleColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${courses[index].totalLessons.toString()} Lessons",
                                          style: bodyStyle.copyWith(
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox.square(
                                      dimension: 50.w,
                                      child: CustomIconButton(
                                        onTap: () {},
                                        iconUrl: courses[index].isSaved
                                            ? AppStrings.saveIconFilled
                                            : AppStrings.saveIcon,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
