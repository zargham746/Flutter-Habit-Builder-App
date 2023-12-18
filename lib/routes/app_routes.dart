import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/views/pages/add_habit.dart';
import 'package:flutter_habit_builder_app/views/pages/community_page.dart';
import 'package:flutter_habit_builder_app/views/pages/course_details_page.dart';
import 'package:flutter_habit_builder_app/views/pages/courses_page.dart';
import 'package:flutter_habit_builder_app/views/pages/create_account.dart';
import 'package:flutter_habit_builder_app/views/pages/forgot_password.dart';
import 'package:flutter_habit_builder_app/views/pages/habit_details.dart';
import 'package:flutter_habit_builder_app/views/pages/home_page.dart';
import 'package:flutter_habit_builder_app/views/pages/login_page.dart';
import 'package:flutter_habit_builder_app/views/pages/onboarding.dart';
import 'package:flutter_habit_builder_app/views/pages/premium_page.dart';
import 'package:flutter_habit_builder_app/views/pages/profile_page.dart';
import 'package:flutter_habit_builder_app/views/pages/settings_page.dart';
import 'package:flutter_habit_builder_app/views/pages/splash.dart';
import 'package:flutter_habit_builder_app/views/widgets/bottom_app_bar.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  // The initial route
  static String initR = "/SplashPage";

  // Private Root Navigator Key
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: "HomeShell");
  static final rootNavigatorCourses =
      GlobalKey<NavigatorState>(debugLabel: "CourseShell");
  static final rootNavigatorCommunity =
      GlobalKey<NavigatorState>(debugLabel: "CommunityShell");
  static final rootNavigatorSetting =
      GlobalKey<NavigatorState>(debugLabel: "SettingShell");

  // Go Router Configuration
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: initR,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomBar(
              navigationShell: navigationShell,
            );
          },
          branches: <StatefulShellBranch>[
            // Home Branch
            StatefulShellBranch(
              navigatorKey: rootNavigatorHome,
              routes: [
                GoRoute(
                  path: "/HomePage",
                  name: "HomePage",
                  builder: (context, state) {
                    return HomePage(
                      key: state.pageKey,
                    );
                  },
                  routes: [
                    // Sub HomePage Views
                    // Add Habit Page
                    GoRoute(
                      path: "AddHabitPage",
                      name: "AddHabitPage",
                      builder: (context, state) {
                        return AddHabitPage(
                          key: state.pageKey,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),

            // COurses Branch
            StatefulShellBranch(
              navigatorKey: rootNavigatorCourses,
              routes: [
                GoRoute(
                  path: "/CoursesPage",
                  name: "CoursesPage",
                  builder: (context, state) {
                    return CoursesPage(
                      key: state.pageKey,
                    );
                  },
                  routes: [
                    // Sub Course Page Views
                    // Course Details Page Page
                    GoRoute(
                      path: "CourseDetailsPage",
                      name: "CourseDetailsPage",
                      builder: (context, state) {
                        return CourseDetailsPage(
                          key: state.pageKey,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),

            // Community Branch
            StatefulShellBranch(
              navigatorKey: rootNavigatorCommunity,
              routes: [
                GoRoute(
                  path: "/CommunityPage",
                  name: "CommunityPage",
                  builder: (context, state) {
                    return CommunityPage(
                      key: state.pageKey,
                    );
                  },
                  routes: [
                    // Sub Course Page Views
                    // Course Details Page Page
                    GoRoute(
                      path: "ProfilePage",
                      name: "ProfilePage",
                      builder: (context, state) {
                        return ProfilePage(
                          key: state.pageKey,
                        );
                      },
                    ),
                    GoRoute(
                      path: "PremiumPage",
                      name: "PremiumPage",
                      builder: (context, state) {
                        return PremiumPage(
                          key: state.pageKey,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),

            // Settings Branch
            StatefulShellBranch(
              navigatorKey: rootNavigatorSetting,
              routes: [
                GoRoute(
                    path: "/SettingsPage",
                    name: "SettingsPage",
                    builder: (context, state) {
                      return SettingsPage(
                        key: state.pageKey,
                      );
                    }),
              ],
            ),
          ]),

      // Add Habit Route
      // GoRoute(
      //   path: "/AddHabitPage",
      //   name: "AddHabitPage",
      //   // parentNavigatorKey: rootNavigatorKey,
      //   builder: (context, state) {
      //     return AddHabitPage(
      //       key: state.pageKey,
      //     );
      //   },
      // ),

      // Splash Page Route
      GoRoute(
        path: "/SplashPage",
        name: "SplashPage",
        builder: (context, state) {
          return SplashPage(
            key: state.pageKey,
          );
        },
      ),

      // Onboarding Page Route
      GoRoute(
          path: "/OnBoardingPage",
          name: "OnBoardingPage",
          builder: (context, state) {
            return OnBoardingPage(
              key: state.pageKey,
            );
          }),

      // Login Page Route
      GoRoute(
        path: "/LoginPage",
        name: "LoginPage",
        builder: (context, state) {
          return LoginPage(
            key: state.pageKey,
          );
        },
      ),

      // Habit Details Page Route
      GoRoute(
        path: "/HabitDetailsPage",
        name: "HabitDetailsPage",
        builder: (context, state) {
          return HabitDetailsPage(
            key: state.pageKey,
          );
        },
      ),

      // Create Account Page Route
      GoRoute(
        path: "/CreateAccountPage",
        name: "CreateAccountPage",
        builder: (context, state) {
          return CreateAccountPage(
            key: state.pageKey,
          );
        },
      ),

      // Forgot Password Page Route
      GoRoute(
        path: "/ForgotPasswordPage",
        name: "ForgotPasswordPage",
        builder: (context, state) {
          return ForgotPasswordPage(
            key: state.pageKey,
          );
        },
      ),
    ],
  );
}
