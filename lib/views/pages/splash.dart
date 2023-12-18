import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool? showLogin;
  @override
  void initState() {
    super.initState();
    getOnBoardingStaus();
    startTimer();
  }

  Future<void> getOnBoardingStaus() async {
    final prefs = await SharedPreferences.getInstance();
    bool show = prefs.getBool("ShowLogin") ?? false;
    if (show == true) {
      setState(() {
        showLogin = true;
      });
    }
    if (show == false) {
      setState(() {
        showLogin = false;
      });
    }
  }

  void startTimer() {
    Timer(
      const Duration(seconds: 3),
      () {
        // Navigate to the new screen after 3 seconds.
        showLogin == true
            ? context.pushReplacementNamed(
                "LoginPage",
              )
            : context.pushReplacementNamed(
                "OnBoardingPage",
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppStrings.splashBackground,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 96.h,
              ),
              Center(
                child: Text(
                  'WELCOME TO\nMONUMENTAL\nHABITS',
                  textAlign: TextAlign.center,
                  style: headerStyle.copyWith(
                      letterSpacing: -3, wordSpacing: 0, height: 1.3.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
