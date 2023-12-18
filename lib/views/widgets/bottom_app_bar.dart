// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/Bottom-Bar';
  final StatefulNavigationShell navigationShell;

  const BottomBar({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final colorIconsUrl = [
    AppStrings.homeIcon,
    AppStrings.coursesIcon,
    AppStrings.communityIcon,
    AppStrings.settingsIcon,
  ];

  final monochromeIconsUrl = [
    AppStrings.homePageIcon,
    AppStrings.coursesPageIcon,
    AppStrings.communityPageIcon,
    AppStrings.settingsPageIcon,
  ];

  void goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: widget.navigationShell,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: isHabitPage ? "Save Habit" : "New Habit",
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            100.r,
          ),
          side: BorderSide(
            width: 5.w,
            color: AppStrings.appLightYellowColor.withAlpha(160),
            style: BorderStyle.solid,
          ),
        ),
        splashColor: Colors.transparent,
        elevation: 0,
        backgroundColor: AppStrings.appYellowColor,
        onPressed: () {
          setState(() {
            isHabitPage = !isHabitPage;
          });
          isHabitPage
              ? context.push(
                  context.namedLocation("AddHabitPage"),
                )
              : context.pop(true);
        },
        child: Image.asset(
          isHabitPage
              // && currentRoute == "AddHabitPage"
              ? AppStrings.tickIcon
              : AppStrings.addIcon,
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: colorIconsUrl.length,
        tabBuilder: (int index, bool isActive) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isActive ? colorIconsUrl[index] : monochromeIconsUrl[index],
                ),
              ),
            ),
          );
        },
        activeIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          goToBranch(_selectedIndex);
        },
        backgroundColor: Colors.white,
        splashColor: Colors.red,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        height: 80.h,
      ),
    );
  }
}
