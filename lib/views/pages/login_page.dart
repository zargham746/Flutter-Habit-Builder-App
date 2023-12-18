// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/views/widgets/continue_with_button.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email = "";
  final formKey = GlobalKey<FormState>();
  String password = "";
  bool isLoading = false;
  bool _obscureText = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          CustomIconButton(
            iconUrl: AppStrings.helpIcon,
            onTap: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 350.h,
            width: double.infinity,
            child: const Image(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  AppStrings.splashBackground,
                )),
          ),
          Container(
            height: 700.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppStrings.appGradientColor,
                    AppStrings.appGradientColor,
                  ],
                  stops: [
                    0.0,
                    0.45,
                    1.0
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated),
            ),
            child: AnimationLimiter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: ScaleAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 250.h,
                    ),
                    Text(
                      'WELCOME TO\nMONUMENTAL HABITS',
                      textAlign: TextAlign.center,
                      style: headerStyle.copyWith(
                        letterSpacing: -3,
                        height: 1.3.h,
                        fontSize: 32.sp,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          ContinueWithButton(
                            width: double.infinity,
                            iconUrl: AppStrings.googleIcon,
                            text: 'Continue with Google',
                            onpress: () {},
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ContinueWithButton(
                            width: double.infinity,
                            iconUrl: AppStrings.facebookIcon,
                            text: 'Continue with Facebook',
                            onpress: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    30.r,
                  ),
                  topRight: Radius.circular(
                    30.r,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                scrollDirection: Axis.vertical,
                child: AnimationLimiter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          height: 15.h,
                        ),
                        Text(
                          'Login with Email',
                          style: bodyStyle.copyWith(
                            color: AppStrings.appPurpleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          thickness: 1.h,
                          color: AppStrings.appLightYellowColor,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  cursorColor: AppStrings.appYellowColor,
                                  style: bodyStyle.copyWith(
                                    color: AppStrings.appYellowColor,
                                    fontSize: 16.sp,
                                  ),

                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.r),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                    ),
                                    prefixIconColor: AppStrings.appYellowColor,
                                    fillColor: AppStrings.appGradientColor,
                                    hintText: "Email",
                                    hintStyle: bodyStyle.copyWith(
                                      color: AppStrings.appYellowColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },

                                  // check tha validation
                                  validator: (val) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val!)
                                        ? null
                                        : "Please enter a valid email";
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextFormField(
                                  obscureText: _obscureText,
                                  cursorColor: AppStrings.appYellowColor,
                                  style: bodyStyle.copyWith(
                                    color: AppStrings.appYellowColor,
                                    fontSize: 16.sp,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.r),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock_outline_rounded,
                                      color: AppStrings.appYellowColor,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      icon: Text(
                                        _obscureText ? 'Show' : 'Hide',
                                        style: bodyStyle.copyWith(
                                          decoration: TextDecoration.underline,
                                          color: AppStrings.appPurpleColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: AppStrings.appLightYellowColor,
                                    hintText: "Password",
                                    hintStyle: bodyStyle.copyWith(
                                      color: AppStrings.appYellowColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.length < 6) {
                                      return "Password must be at least 6 characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                            top: 20.h,
                          ),
                          child: CustomButton(
                              backgroundColor: const Color(0xffFDA758),
                              onpress: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  GoRouter.of(context).go(
                                    "/HomePage",
                                  );
                                }
                              },
                              text: 'Login'),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            context.pushNamed(
                              "ForgotPasswordPage",
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: bodyStyle.copyWith(
                              color: AppStrings.appPurpleColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushReplacementNamed(
                              "CreateAccountPage",
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: bodyStyle.copyWith(
                                    color: AppStrings.appPurpleColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: '  Sign Up',
                                  style: bodyStyle.copyWith(
                                    color: AppStrings.appPurpleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
