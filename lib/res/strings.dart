import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStrings {
  static const appName = 'Habit Builder';
  static const baseImageUrl = 'assets/images';
  static const baseIconUrl = 'assets/icons';
  static const baseVideosUrl = "assets/videos";
  // App Colors
  static const appYellowColor = Color(0xffFEA800);
  static const appBlueColor = Color(0xff1B237E);
  static const appPinkColor = Color(0xffFF6767);
  static const appPurpleColor = Color(0xff573353);
  static const appPaleBlueColor = Color(0xffB1AFE9);
  static const appLightBlueColor = Color(0xffDDDCFE);
  static const appGradientColor = Color(0xffFFF3E9);
  static const appLightYellowColor = Color(0xffFFF3E9);
  static const appCreamColor = Color.fromRGBO(251, 234, 219, 100);
// App Image Assets
  static const splashBackground = "$baseImageUrl/splash-background.png";
  static const onBoarding1 = "$baseImageUrl/onboarding-1.png";
  static const onBoarding2 = "$baseImageUrl/onboarding-2.png";
  static const onBoarding3 = "$baseImageUrl/onboarding-3.png";
  static const onBoarding4 = "$baseImageUrl/onboarding-4.png";
  static const forgotPassword = "$baseImageUrl/forgot_password.png";
  static const createAccount = "$baseImageUrl/create_account.png";
  static const userImage = "$baseImageUrl/user_image.png";
  static const homeBackground = "$baseImageUrl/home_back.png";
  static const habitTriangle = "$baseImageUrl/habit_triangle.png";
  static const swirly = "$baseImageUrl/swirly.png";
  static const swirlyImage = "$baseImageUrl/swirly_image.png";
  static const course1Image = "$baseImageUrl/course_1.jpg";
  static const course2Image = "$baseImageUrl/course_2.png";
  static const user1Image = "$baseImageUrl/user_1.png";
  static const user2Image = "$baseImageUrl/user_2.png";
  static const user3Image = "$baseImageUrl/user_3.png";
  static const user4Image = "$baseImageUrl/user_4.png";

  // App Icon assets
  static const helpIcon = "$baseIconUrl/help.png";
  static const googleIcon = "$baseIconUrl/google.png";
  static const facebookIcon = "$baseIconUrl/facebook.png";
  static const backIcon = "$baseIconUrl/back.png";
  static const userIcon = "$baseIconUrl/user.png";
  static const menuIcon = "$baseIconUrl/menu_icon.png";
  static const searchIcon = "$baseIconUrl/search_icon.png";
  static const addHabitIcon = "$baseIconUrl/habit_add.png";
  static const downArrow = "$baseIconUrl/down_arrow.png";
  static const tickIcon = "$baseIconUrl/tick_icon.png";
  static const editIcon = "$baseIconUrl/edit_icon.png";
  static const longestStreakIcon = "$baseIconUrl/longest_streak.png";
  static const currentStreakIcon = "$baseIconUrl/current_streak.png";
  static const completionRateIcon = "$baseIconUrl/completion_rate.png";
  static const averageScoreIcon = "$baseIconUrl/average_score.png";
  static const closeIcon = "$baseIconUrl/close_icon.png";
  static const saveIcon = "$baseIconUrl/save_icon.png";
  static const saveIconFilled = "$baseIconUrl/save_icon_filled.png";
  static const playIcon = "$baseIconUrl/play_icon.png";
  static const lockIcon = "$baseIconUrl/lock_icon.png";
  static const shareIcon = "$baseIconUrl/share_icon.png";
  static const likeIcon = "$baseIconUrl/like_icon.png";
  static const commentIcon = "$baseIconUrl/comment_icon.png";
  static const watchIcon = "$baseIconUrl/watch_icon.png";
  static const flagIcon = "$baseIconUrl/flag_icon.png";
  static const billingMethodsIcon = "$baseIconUrl/billing_method.png";
  static const profileLongestStreakIcon =
      "$baseIconUrl/longest_streak_profile.png";
  static const notificationIcon = "$baseIconUrl/notification.png";
  static const moreIcon = "$baseIconUrl/more.png";
  static const contactIcon = "$baseIconUrl/contact.png";
  static const feedbackIcon = "$baseIconUrl/feedback.png";
  static const privacypolicyIcon = "$baseIconUrl/privacy_policy.png";
  static const aboutIcon = "$baseIconUrl/about.png";
  static const secureIcon = "$baseIconUrl/secure.png";
  // Bottom Bar Color Icons
  static const homeIcon = "$baseIconUrl/home_color.png";
  static const settingsIcon = "$baseIconUrl/settings_color.png";
  static const communityIcon = "$baseIconUrl/community_color.png";
  static const coursesIcon = "$baseIconUrl/courses_color.png";
  static const addIcon = "$baseIconUrl/add_icon.png";

  // Bottom Bar Monochrome Icons
  static const homePageIcon = "$baseIconUrl/home.png";
  static const settingsPageIcon = "$baseIconUrl/settings.png";
  static const coursesPageIcon = "$baseIconUrl/courses.png";
  static const communityPageIcon = "$baseIconUrl/community.png";

  // Video Assets
  static const courseVideo = "$baseVideosUrl/video.mp4";
}

final TextStyle headerStyle = TextStyle(
  fontFamily: 'Klasik',
  fontSize: 40.sp,
  color: AppStrings.appPurpleColor,
);

final TextStyle bodyStyle = TextStyle(
  fontFamily: 'Manrope',
  fontSize: 17.sp,
);

// Folder Paths
const imagesFolderPath = 'assets/images/';
const iconsFolderPath = 'assets/icons/';

// Habit Containers
Container habitInProgressContainer = Container(
  height: 50.h,
  width: 50.w,
  margin: EdgeInsets.only(
    right: 10.w,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(
        10.r,
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
);

Container habitnotStartedContainer = Container(
  height: 50.h,
  width: 50.w,
  margin: EdgeInsets.only(
    right: 10.w,
  ),
  decoration: BoxDecoration(
    color: AppStrings.appLightYellowColor,
    borderRadius: BorderRadius.circular(
      10.r,
    ),
    border: Border.all(
      width: 3.w,
      color: AppStrings.appLightYellowColor,
    ),
  ),
);

Container habitCompletedContainer = Container(
  height: 50.h,
  width: 50.w,
  margin: EdgeInsets.only(
    right: 10.w,
  ),
  decoration: BoxDecoration(
    border: Border.all(
      width: 5.w,
      color: AppStrings.appLightYellowColor,
    ),
    color: Colors.orange,
    borderRadius: BorderRadius.circular(
      10.r,
    ),
  ),
);

// Global variables

// Check if user is on Add Habit Page or not
bool isHabitPage = false;
