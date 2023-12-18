import 'package:flutter/material.dart';
import 'package:flutter_habit_builder_app/res/strings.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_button.dart';
import 'package:flutter_habit_builder_app/views/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String email = "";
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController emailConroller = TextEditingController();

  @override
  void dispose() {
    emailConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppStrings.appLightYellowColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: CustomIconButton(
            onTap: () {
              context.pop(true);
            },
            iconUrl: AppStrings.backIcon,
          ),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: AnimationLimiter(
          child: Column(
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
                  height: 120.h,
                ),
                Text(
                  'FORGOT YOUR PASSWORD?',
                  style: headerStyle.copyWith(
                    fontSize: 24.sp,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  AppStrings.forgotPassword,
                  height: 264.h,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.all(
                    20.w,
                  ),
                  padding: EdgeInsets.all(
                    20.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Enter your registered email below to receive password reset instruction',
                          textAlign: TextAlign.center,
                          style: bodyStyle.copyWith(
                            color: AppStrings.appPurpleColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          controller: emailConroller,
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
                          height: 20.h,
                        ),
                        CustomButton(
                            backgroundColor: const Color(0xffFDA758),
                            onpress: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                              }
                            },
                            text: 'Send Reset Link'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                GestureDetector(
                  onTap: () {
                    context.pop(true);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Remember Password?',
                          style: bodyStyle.copyWith(
                            color: AppStrings.appPurpleColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: ' Login',
                          style: bodyStyle.copyWith(
                            color: AppStrings.appPurpleColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
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
    );
  }
}
