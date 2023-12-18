// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/pages/profile_page.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';

import '../widgets/general_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStrings.appLightYellowColor,
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
          'Settings',
          style: bodyStyle.copyWith(
            fontSize: 18.spMax,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.w,
              ).copyWith(
                right: 150.w,
                left: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Check Your Profile',
                    style: headerStyle.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    'jonathansmith@gmail.com',
                    style: bodyStyle.copyWith(
                      color: AppStrings.appPurpleColor.withAlpha(50),
                      letterSpacing: 0,
                      fontSize: 16.sp,
                      wordSpacing: -3,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      fixedSize: Size(
                        120.w,
                        40.h,
                      ),
                      backgroundColor: AppStrings.appYellowColor,
                    ),
                    onPressed: () {
                      context.push(
                        context.namedLocation("ProfilePage"),
                      );
                    },
                    child: Text(
                      "View",
                      style: bodyStyle.copyWith(
                        color: AppStrings.appPurpleColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        wordSpacing: -3,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Text(
              "General",
              style: bodyStyle.copyWith(
                color: AppStrings.appPurpleColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                wordSpacing: -3,
                letterSpacing: 0,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          // General Settings Container
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: GeneralContainer(
              imageUrl: AppStrings.notificationIcon,
              title: "Notifications",
              subtitle: "Customize notifications",
              onPress: () {},
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: GeneralContainer(
              imageUrl: AppStrings.notificationIcon,
              title: "More Customization",
              subtitle: "Customize it more to fit your usage",
              onPress: () {},
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Text(
              "Support",
              style: bodyStyle.copyWith(
                color: AppStrings.appPurpleColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                wordSpacing: -3,
                letterSpacing: 0,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ProfileContainer(
            imageUrl: AppStrings.contactIcon,
            title: "Contact",
            onpress: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          ProfileContainer(
            imageUrl: AppStrings.feedbackIcon,
            title: "Feedback",
            onpress: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          ProfileContainer(
            imageUrl: AppStrings.privacypolicyIcon,
            title: "Privacy Policy",
            onpress: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          ProfileContainer(
            imageUrl: AppStrings.aboutIcon,
            title: "About",
            onpress: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
